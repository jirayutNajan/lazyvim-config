-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- ปิดระบบ Diagnostic (Error/Warning) สำหรับ Buffer ปัจจุบัน (ไฟล์ .md)
    -- สำหรับ Neovim 0.10+ (LazyVim ปัจจุบันแนะนำให้ใช้ตัวนี้)
    vim.diagnostic.enable(false, { bufnr = 0 })
    
    -- หมายเหตุ: ถ้าคุณใช้ Neovim ต่ำกว่าเวอร์ชั่น 0.10 ให้คอมเมนต์บรรทัดบน 
    -- แล้วเอาคอมเมนต์บรรทัดล่างออกแทนครับ
    -- vim.diagnostic.disable(0)
  end,
})
