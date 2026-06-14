return {
  "prichrd/netrw.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("netrw").setup({
      -- เปิดใช้งานการดึง Icon จาก nvim-web-devicons
      use_devicons = true, 
      
      -- คุณสามารถ Custom Icon พื้นฐานบางส่วนได้
      icons = {
        symlink = "", 
        directory = "", 
        opened = "", 
      },
    })
  end
}
