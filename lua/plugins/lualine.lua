return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_c = {
        {
          "filename",
          path = 1, -- 1: Relative path, 2: Absolute path
        },
      }
    end,
  },
}
