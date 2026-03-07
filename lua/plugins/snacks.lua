return {
  "folke/snacks.nvim",
  opts = {
    -- ตั้งค่า FPS รวมสำหรับทุกแอนิเมชันของ snacks (เช่น Dashboard, Notifier)
    animate = {
      fps = 120, -- ปรับค่าตามต้องการ (ค่าเริ่มต้นปกติคือ 120)
    },
    -- ถ้าต้องการเน้นปรับความลื่นไหลของการ Scroll
    scroll = {
      animate = {
        fps = 120, -- ปรับ FPS เฉพาะตอนเลื่อนหน้าจอ
      },
    },
  },
}
