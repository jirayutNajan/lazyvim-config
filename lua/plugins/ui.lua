-- ทำให้ tokyonight transparent
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true, -- เปิดความโปร่งใสที่นี่
      -- styles = {
      --   sidebars = "transparent", -- ทำให้แถบข้าง (Explorer) ใส
      --   floats = "transparent",   -- ทำให้หน้าต่างลอย (Floating windows) ใส
      -- },
    },
  },
}
