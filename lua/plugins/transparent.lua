return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({
      -- เพิ่มกลุ่มที่ต้องการให้โปร่งใสเพิ่มเติม (ถ้ามี)
      extra_groups = {
        "NormalFloat", 
        "NvimTreeNormal",
      },
    })
  end,
}
