-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymap
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

-- 3. ย้ายฟังก์ชัน Information/Hover ไปไว้ที่ I (Shift + i)
-- ปกติ LazyVim ใช้ vim.lsp.buf.hover()
vim.keymap.set("n", "I", vim.lsp.buf.hover, { desc = "LSP Information (Hover)" })

-- กด Esc เพื่อออกจาก Terminal Mode กลับสู่ Normal Mode
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })

-- ใช้ Enter แทนปุ่ม * (ค้นหาคำใต้ Cursor)
vim.keymap.set("n", "<CR>", "*", { desc = "Search word under cursor" })
