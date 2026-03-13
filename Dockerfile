FROM node:18-alpine

WORKDIR /app

# 1. ติดตั้ง Dependencies ของ Backend
COPY TODO/todo_backend/package*.json ./
RUN npm install

# 2. ก๊อปปี้ไฟล์ Backend ทั้งหมดมาไว้ที่ /app
COPY TODO/todo_backend/ .

# 3. แก้ปัญหา Error โดยสร้างโฟลเดอร์ดักไว้
# สร้างโครงสร้างโฟลเดอร์ตามที่ Error ฟ้องหา (static/build)
RUN mkdir -p static/build

# ก๊อปปี้ไฟล์หน้าเว็บจาก todo_frontend ไปวางในที่ที่ Backend ต้องการ
# เราจะก๊อปไฟล์ index.html และไฟล์อื่นๆ ใน public ไปเป็นหน้าเว็บหลัก
COPY TODO/todo_frontend/public/ ./static/build/

EXPOSE 5000

# รันแอป
CMD ["node", "server.js"]