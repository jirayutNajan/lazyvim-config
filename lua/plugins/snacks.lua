return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- 1. ตั้งค่า Global Animation (สำหรับ Dashboard, Layouts, ฯลฯ)
    animate = {
      fps = 120,
    },
    -- 2. ตั้งค่าการ Scroll หน้าจอ (Smooth Scroll)
    scroll = {
      enabled = true, -- มั่นใจว่าหน้าจอเปิด
      animate = {
        fps = 120,
      },
    },
    -- 3. ตั้งค่าการแจ้งเตือน (Notifications)
    notifier = {
      enabled = true,
      animate = {
        fps = 120,
      },
    },
    dashboard = {
      preset = {
        pick = nil,
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
     ▄█  ▄██████▄  ▀█████████▄       ▄█    ▄████████ ▀█████████▄  
    ███ ███    ███   ███    ███     ███   ███    ███   ███    ███ 
    ███ ███    ███   ███    ███     ███   ███    ███   ███    ███ 
    ███ ███    ███  ▄███▄▄▄██▀      ███   ███    ███  ▄███▄▄▄██▀  
    ███ ███    ███ ▀▀███▀▀▀██▄      ███ ▀███████████ ▀▀███▀▀▀██▄  
    ███ ███    ███   ███    ██▄     ███   ███    ███   ███    ██▄ 
    ███ ███    ███   ███    ███     ███   ███    ███   ███    ███ 
█▄ ▄███  ▀██████▀  ▄█████████▀  █▄ ▄███   ███    █▀  ▄█████████▀  
▀▀▀▀▀▀                          ▀▀▀▀▀▀                            
"An idiot admires complexity, a genius admires simplicity"
      ]],
      },
    },
  },
}
