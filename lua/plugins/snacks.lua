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
      enabled = true, -- มั่นใจว่าเปิดใช้งานไว้
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
    -- 4. ตั้งค่าหน้า Dashboard (เผื่อมีแอนิเมชันตอนเปิด)
    dashboard = {
      animate = {
        fps = 120,
      },
    },
  },
}
