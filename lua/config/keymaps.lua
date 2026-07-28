-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ลบ keymap <leader>gd ตัวเดิมของ LazyVim ออกก่อน
vim.keymap.del("n", "<leader>gd")

-- สร้าง keymap ใหม่โดยใช้ vim.cmd เรียกคำสั่งโดยตรง
vim.keymap.set("n", "<leader>gd", function()
  -- เด้งกล่องข้อความถามหา Commit Hash (กด Enter ผ่านเพื่อใช้ Commit ล่าสุด)
  vim.ui.input({ prompt = "Enter Commit Hash / Ref (Default: HEAD~1): " }, function(input)
    if input == nil then return end
    
    -- ถ้าไม่ได้พิมพ์อะไรเลย ให้ตั้งเป็น HEAD~1
    local ref = input == "" and "HEAD~1" or input
    
    -- สั่งรันคำสั่งตรงๆ เหมือนที่เราพิมพ์ใน Command mode
    local success, err = pcall(function()
      vim.cmd("Gitsigns change_base " .. ref)
    end)
    
    if success then
      vim.notify("Gitsigns base changed to: " .. ref, vim.log.levels.INFO)
    else
      vim.notify("Failed to change Gitsigns base: " .. tostring(err), vim.log.levels.ERROR)
    end
  end)
end, { desc = "Git Diff with Commit (Gitsigns)" })

-- ==========================================
-- Your Personal Keymaps
-- ==========================================

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

-- ใช้ W เพื่อไปที่ท้ายบรรทัด (เหมือน $)
vim.keymap.set({ "n", "v", "o" }, "W", "$", { noremap = true })

-- ใช้ B เพื่อไปที่ต้นบรรทัด (เหมือน _)
vim.keymap.set({ "n", "v", "o" }, "B", "_", { noremap = true })

vim.keymap.set("n", "J", "5j", { noremap = true, silent = true })
vim.keymap.set("n", "K", "5k", { noremap = true, silent = true })

-- ย้ายฟังก์ชัน Information/Hover ไปไว้ที่ I (Shift + i)
vim.keymap.set("n", "I", vim.lsp.buf.hover, { desc = "LSP Information (Hover)" })

-- กด Esc เพื่อออกจาก Terminal Mode กลับสู่ Normal Mode
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })

-- ใช้ Enter แทนปุ่ม * (ค้นหาคำใต้ Cursor)
vim.keymap.set("n", "<CR>", "*", { desc = "Search word under cursor" })

-- ปรับขนาด window ทางแนวตั้งทีละเยอะๆ
vim.keymap.set("n", "<leader>{", "<cmd>vertical resize -25<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<leader>}", "<cmd>vertical resize +25<cr>", { desc = "Increase window width" })

-- Toggle Autocomplete สำหรับ blink.cmp โดยใช้ <leader>ux
vim.keymap.set("n", "<leader>ux", function()
  if vim.g.blink_enabled == nil then
    vim.g.blink_enabled = true
  end
  vim.g.blink_enabled = not vim.g.blink_enabled
  
  if vim.g.blink_enabled then
    vim.notify("Autocomplete: Enabled", vim.log.levels.INFO)
  else
    vim.notify("Autocomplete: Disabled", vim.log.levels.WARN)
  end
end, { desc = "Toggle Autocomplete (Blink)" })

-- ปิด Tab แล้วเลื่อนไป Tab ด้านขวาแบบ Chrome
vim.keymap.set("n", "<leader>bd", function()
  local current_buf = vim.api.nvim_get_current_buf()
  -- วนไป Buffer ถัดไป (ทางขวา) ก่อน
  vim.cmd("BufferLineCycleNext")
  -- จากนั้นลบ Buffer เดิมที่เพิ่งปิดไป
  Snacks.bufdelete(current_buf)
end, { desc = "Delete Buffer (Chrome style)" })
