return {
  {
    "saghen/blink.cmp",
    opts = {
      enabled = function()
        return vim.g.blink_enabled ~= false
      end,
      completion = {
        ghost_text = {
          enabled = false,
        },
      },
    },
  },
}
