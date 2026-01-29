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

-- 1. ลบ Keymap เดิมที่ซ้ำซ้อนออกก่อน (Optional แต่อนะนำ)
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")

-- 2. ตั้งค่าให้ Ctrl + h/l ใช้เลื่อน Buffer (Tabs ด้านบน)
vim.keymap.set("n", "<C-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<C-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- 3. ตั้งค่าให้ Shift + h/j/k/l ใช้เลื่อนระหว่าง Window (Splits/Neo-tree)
vim.keymap.set("n", "<S-h>", "<C-w>h", { desc = "Go to Left Window" })
-- vim.keymap.set("n", "<S-j>", "<C-w>j", { desc = "Go to Lower Window" })
-- vim.keymap.set("n", "<S-k>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<S-l>", "<C-w>l", { desc = "Go to Right Window" })
