return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          -- ภายใต้ keys จะเป็นการจัดการคีย์ลัดของ LSP โดยเฉพาะ
          keys = {
            -- 1. สั่งให้ K ของเดิมใน LSP เป็น false (เพื่อเปิดทางให้ keymaps.lua ทำงาน)
            { "K", false },
            -- 2. ย้ายคำสั่ง Hover ไปที่ I แทน (ตามที่คุณต้องการ)
            { "I", vim.lsp.buf.hover, desc = "Hover" },
          },
        },
      },
    },
  },
}
