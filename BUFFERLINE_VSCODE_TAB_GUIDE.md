# สรุปการตั้งค่า Buffer Tab ใน LazyVim ให้ทำงานเหมือน VSCode

เอกสารนี้สรุปปัญหาที่เคยเกิดขึ้นกับการจัดการ Buffer Tab ใน LazyVim / Neovim พร้อมแนวทางแก้ไขและการตั้งค่าให้ Tab เปิดปิดเหมือน **VSCode 100%** (เปิดแทรกข้างขวาของ Tab ปัจจุบันเสมอ และปิดย้ายโฟกัสไป Tab ข้างเคียง)

---

## 1. ปัญหาที่เคยเกิดขึ้น (Previous Issues & Root Causes)

### 🔴 ปัญหาที่ 1: ตั้งค่า `sort_by = "insert_after_current"` แล้ว Tab ยังถูกเปิดที่ท้ายสุด (Far Right)
- **สาเหตุ**: ใน `bufferline.nvim` ตัวเรียงลำดับแบบ `insert_after_current` ของเดิม จะคำนวณตำแหน่ง `current_index` ณ จังหวะที่เปิดไฟล์ใหม่
- เมื่อเปิดไฟล์ผ่าน File Explorer (Neo-tree), Finder (Telescope / Snacks Picker) หรือ `gd` (Go to definition) โฟกัสชั่วขณะจะหลุดไปอยู่ที่ window อื่นก่อน ทำให้ `bufferline` คำนวณตำแหน่งผิดพลาด แล้วนำไฟล์ใหม่ไปวางต่อท้ายสุดทางขวาแทนที่จะวางข้างๆ Tab ปัจจุบัน

### 🔴 ปัญหาที่ 2: กด `gd` หรือเปิดไฟล์แล้วลำดับ Tab เรียงสลับมั่ว
- **สาเหตุ**: การพยายามเขียนฟังก์ชันเปรียบเทียบ `sort_by` แบบ Custom Sorter ร่วมกับ Autocmd `BufEnter` โดยไม่มีการคัดกรอง Buffer ชนิดพิเศษ (เช่น Terminal, Neo-tree, Float Window, Picker) ทำให้ array ลำดับหลุด Sync กับ State ภายในของ `bufferline` ผลลัพธ์คือค่า Index ส่งกลับเป็นค่าเริ่มต้นเดียวกัน ทำให้ Tab ลอยสลับตำแหน่งไปมา

### 🔴 ปัญหาที่ 3: เวลาปิด Tab แล้ว cursor กระโดดข้ามไปไฟล์เก่าที่เปิดไว้นานแล้ว (Alternate Buffer)
- **สาเหตุ**: การปิด Buffer แบบ Neovim/LazyVim ค่าเริ่มต้นจะย้าย cursor ไปยัง Alternate Buffer (`#`) ซึ่งมักจะเป็นไฟล์ที่เคยเปิดเมื่อนานมาแล้ว ไม่ใช่ Tab ที่อยู่ข้างเคียง ทำให้ความรู้สึกในการใช้งานต่างจาก VSCode / Chrome

---

## 2. แนวทางการแก้ไข (VSCode Solution)

เพื่อให้ได้พฤติกรรมแบบ VSCode สมบูรณ์แบบ เราทำการแก้ไขในไฟล์ [`lua/plugins/bufferline.lua`](file:///Users/kla/.config/nvim/lua/plugins/bufferline.lua) ดังนี้:

### 1️⃣ การเปิด Tab ใหม่ (Insert After Current Active Tab)
- สร้างฟังก์ชันคัดกรองเฉพาะ Buffer ไฟล์จริง (`is_valid_file_buf`) โดยข้าม Terminal, Neo-tree, Telescope, Snacks Picker ฯลฯ
- คอยจำ Buffer ไฟล์ล่าล่าสุดที่ผู้ใช้ทำงานอยู่จริง (`last_active_buf`)
- เมื่อมีการเปิด Buffer ไฟล์ใหม่ ระบบจะตรวจสอบและแทรก Buffer ใหม่เข้าไปใน `state.custom_sort` ของ `bufferline` ที่ตำแหน่ง `last_active_buf + 1` ทันที แล้วสั่ง `bufferline.ui.refresh()`
- **ผลลัพธ์**: ไม่ว่าจะเปิดไฟล์ด้วยวิธีใด (File Tree, Finder หรือ `gd`) Tab ใหม่จะถูกเปิดแทรก**ข้างขวาของ Tab ปัจจุบัน**เสมอ

### 2️⃣ การปิด Tab (VSCode Style Close Behavior)
- เมื่อกดปิด Tab ปัจจุบัน (`<leader>bd` หรือกดปุ่ม ✖ ที่ Tab)
- ระบบจะค้นหาตำแหน่ง Index ปัจจุบันใน `state.custom_sort`:
  - หากมี Tab ทางขวา -> ย้ายโฟกัสไป Tab ทางขวา (`current_idx + 1`)
  - หากเป็น Tab ขวาสุด -> ย้ายโฟกัสไป Tab ทางซ้าย (`current_idx - 1`)
- จากนั้นจึงสั่งลบ Buffer ออกด้วย `Snacks.bufdelete`

---

## 3. โค้ดคอนฟิกสมบูรณ์ ([`lua/plugins/bufferline.lua`](file:///Users/kla/.config/nvim/lua/plugins/bufferline.lua))

```lua
local last_active_buf = nil

-- คัดกรองเฉพาะ Buffer ที่เป็นไฟล์จริง (ไม่รวม Terminal, Neo-tree, Picker ฯลฯ)
local function is_valid_file_buf(buf)
  if not buf or not vim.api.nvim_buf_is_valid(buf) then return false end
  if not vim.bo[buf].buflisted then return false end
  local buftype = vim.bo[buf].buftype
  if buftype ~= "" then return false end
  local ft = vim.bo[buf].filetype
  if ft == "neo-tree" or ft == "NvimTree" or ft == "snacks_picker" or ft == "TelescopePrompt" then return false end
  return true
end

-- เมื่อมีการเข้าถึง Buffer ไฟล์ใหม่ แทรกเข้าไปต่อจาก last_active_buf ทันที
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(args)
    local buf = args.buf
    if is_valid_file_buf(buf) then
      local status, state = pcall(require, "bufferline.state")
      local ui_status, ui = pcall(require, "bufferline.ui")

      if status and state then
        if not state.custom_sort or #state.custom_sort == 0 then
          local sort = {}
          for _, b in ipairs(vim.api.nvim_list_bufs()) do
            if is_valid_file_buf(b) then
              table.insert(sort, b)
            end
          end
          state.custom_sort = sort
        end

        local exists = false
        for _, id in ipairs(state.custom_sort) do
          if id == buf then
            exists = true
            break
          end
        end

        if not exists then
          local target_idx = nil
          if last_active_buf then
            for idx, id in ipairs(state.custom_sort) do
              if id == last_active_buf then
                target_idx = idx
                break
              end
            end
          end

          if target_idx then
            table.insert(state.custom_sort, target_idx + 1, buf)
          else
            table.insert(state.custom_sort, buf)
          end
          if ui_status and ui then pcall(ui.refresh) end
        end
      end

      last_active_buf = buf
    end
  end,
})

-- ลบ Buffer ออกจาก custom_sort เมื่อ Buffer ถูกปิด
vim.api.nvim_create_autocmd("BufDelete", {
  callback = function(args)
    local buf = args.buf
    local status, state = pcall(require, "bufferline.state")
    if status and state and state.custom_sort then
      for idx, id in ipairs(state.custom_sort) do
        if id == buf then
          table.remove(state.custom_sort, idx)
          break
        end
      end
      local ui_status, ui = pcall(require, "bufferline.ui")
      if ui_status and ui then pcall(ui.refresh) end
    end
  end,
})

-- ปิด Tab แบบ VSCode (ย้ายไป Tab ขวา หรือซ้ายกรณีขวาสุด)
local function close_buffer_vscode_style(target_buf)
  target_buf = target_buf or vim.api.nvim_get_current_buf()
  local current_buf = vim.api.nvim_get_current_buf()

  if target_buf == current_buf then
    local status, state = pcall(require, "bufferline.state")
    local sort = (status and state and state.custom_sort) or {}
    local current_idx = nil
    for idx, id in ipairs(sort) do
      if id == target_buf then
        current_idx = idx
        break
      end
    end

    if current_idx then
      if current_idx < #sort then
        vim.api.nvim_set_current_buf(sort[current_idx + 1])
      elseif current_idx > 1 then
        vim.api.nvim_set_current_buf(sort[current_idx - 1])
      end
    end
  end

  if Snacks and Snacks.bufdelete then
    Snacks.bufdelete(target_buf)
  else
    vim.cmd("bd " .. target_buf)
  end
end

return {
  "akinsho/bufferline.nvim",
  keys = {
    { "<leader>bd", function() close_buffer_vscode_style() end, desc = "Delete Buffer (VSCode style)" },
    { "<leader>bD", function() close_buffer_vscode_style() end, desc = "Delete Buffer (Force)" },
  },
  opts = {
    options = {
      close_command = function(bufnr)
        close_buffer_vscode_style(bufnr)
      end,
      right_mouse_command = function(bufnr)
        close_buffer_vscode_style(bufnr)
      end,
    },
  },
}
```
