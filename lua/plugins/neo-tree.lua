return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      -- ไม่เปลี่ยน Root Folder หรือสร้าง State แยกตาม CWD ของแต่ละ buffer
      bind_to_cwd = false,
      -- ให้ Neo-tree อยู่ในสถานะ Global แชร์ร่วมกันทุก Buffer/Tab
      cwd_target = {
        sidebar = "tab",
        current = "window",
      },
      -- (Option) ให้โฟกัสไปยังไฟล์ปัจจุบันใน Tree โดยไม่รีเซ็ตโฟลเดอร์อื่นที่เปิดไว้
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true, -- เปิดโฟลเดอร์อื่นๆ ค้างไว้ ไม่สั่งยุบกลับ
      },
    },
  },
}
