return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      term_colors = true,
      integrations = {
        telescope = true,
        treesitter = true,
        mason = true,
        custom_highlights = function(colors)
          return {
            Comment = { fg = "#888888" },
            DiagnosticUnnecessary = { fg = "#707070", style = { "underline" } },
          }
        end,
      },
    },
  },
  {
    "olimorris/onedarkpro.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- เปลี่ยนตรงนี้เป็น "catppuccin-nvim"
      colorscheme = "catppuccin-nvim",
    },
  },
}
