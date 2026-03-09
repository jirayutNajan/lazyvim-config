return {
  {
    "saghen/blink.cmp",
    opts = {
      -- เพิ่มส่วนนี้เข้าไปครับ
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
