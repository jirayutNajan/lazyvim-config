return {
  -- 1. ติดตั้ง Plugin ของ Theme
  {
    "EdenEast/nightfox.nvim",
    lazy = false, -- โหลดทันทีที่เปิด
    priority = 1000, -- ให้ความสำคัญสูงกว่า Plugin อื่น
    config = function()
      -- สั่งให้ใช้สี carbonfox (เทาดำ)
      vim.cmd("colorscheme carbonfox")
    end,
  },

  -- 2. (ทางเลือก) ถ้าใช้ Catppuccin Mocha ให้ใช้โค้ดชุดนี้แทน
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("catppuccin-mocha")
  --   end,
  -- },
}
