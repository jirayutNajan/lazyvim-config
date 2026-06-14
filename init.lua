-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd('colorscheme tokyonight-night')
vim.opt.relativenumber = false
vim.opt.termguicolors = true

-- if vim.g.neovide then
--     vim.o.guifont = "JetBrainsMono Nerd Font,Sarabun:h12"
--
--   -- ตั้งค่า Scale เริ่มต้น (1.0 คือปกติ)
--     vim.g.neovide_scale_factor = 1.0
--
--     -- ฟังก์ชันสำหรับเปลี่ยนค่า Scale
--     local change_scale_factor = function(delta)
--         vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
--     end
--
--     -- ตั้งปุ่มลัด (Shortcut)
--     -- Cmd + = เพื่อขยาย (บน Mac ใช้ <D- คือปุ่ม Command)
--     vim.keymap.set("n", "<D-=>", function() change_scale_factor(1.1) end)
--     -- Cmd + - เพื่อย่อ
--     vim.keymap.set("n", "<D-->", function() change_scale_factor(1/1.1) end)
--     -- Cmd + 0 เพื่อรีเซ็ตเป็น 1.0
--     vim.keymap.set("n", "<D-0>", function() vim.g.neovide_scale_factor = 1.0 end)
--
--     -- ตั้งให้กด Cmd+c เพื่อ Copy (ในโหมด Normal และ Visual)
--     vim.keymap.set({'n', 'v'}, '<D-c>', '"+y', { noremap = true, silent = true })
--
--     -- ตั้งให้กด Cmd+v เพื่อ Paste (ในโหมด Normal และ Visual)
--     vim.keymap.set({'n', 'v'}, '<D-v>', '"+p', { noremap = true, silent = true })
--
--     -- ตั้งให้กด Cmd+v เพื่อ Paste ในโหมด Insert (ตอนกำลังพิมพ์)
--     vim.keymap.set('i', '<D-v>', '<C-r>+', { noremap = true, silent = true })
--
--     -- ตั้งให้กด Cmd+v เพื่อ Paste ในโหมด Command (ตอนกด : เพื่อพิมพ์คำสั่ง)
--     vim.keymap.set('c', '<D-v>', '<C-r>+', { noremap = true, silent = true })
--     -- ตั้งให้กด Cmd+v เพื่อ Paste ในโหมด Command (ตอนกด : เพื่อพิมพ์คำสั่ง)
--     vim.keymap.set('c', '<D-v>', '<C-R>+', { noremap = true })
--
--     -- ตั้งให้กด Cmd+v เพื่อ Paste ในโหมด Command (ตอนกด : เพื่อพิมพ์คำสั่ง)
--     vim.keymap.set('t', '<D-v>', '<C-r>+', { noremap = true, silent = true })
--     -- ตั้งให้กด Cmd+v เพื่อ Paste ในโหมด Command (ตอนกด : เพื่อพิมพ์คำสั่ง)
--     vim.keymap.set('t', '<D-v>', '<C-R>+', { noremap = true })
-- end
