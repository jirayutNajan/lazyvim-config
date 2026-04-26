return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- ให้โหลดเป็นลำดับแรกๆ
    opts = {
      flavour = "mocha", -- เลือกแนวสี (latte, frappe, macchiato, mocha)
      -- transparent_background = true,
      term_colors = true,
      integrations = {
        telescope = true,
        treesitter = true,
        mason = true,
        -- ปรับแต่งสี Comment และ Unused ตามที่คุณต้องการจากข้อความที่แล้ว
        custom_highlights = function(colors)
          return {
            Comment = { fg = "#888888" }, -- ปรับสี comment ให้สว่างขึ้นตามชอบ
            DiagnosticUnnecessary = { fg = "#707070", style = { "underline" } },
          }
        end,
      },
    },
  },

  -- ถ้าต้องการให้มันเป็น Theme เริ่มต้นทันทีที่เปิดเครื่อง ให้แก้ตรงนี้ด้วย
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
