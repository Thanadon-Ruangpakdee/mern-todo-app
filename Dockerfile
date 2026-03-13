FROM node:18-alpine

WORKDIR /app

# 1. ติดตั้ง dependencies ของ Backend
COPY TODO/todo_backend/package*.json ./
RUN npm install

# 2. ก๊อปปี้ไฟล์ Backend ทั้งหมดมาไว้ที่ /app
COPY TODO/todo_backend/ .

# 3. แก้ปัญหา Error: สร้างโฟลเดอร์ที่แอปเรียกหา และก๊อปปี้ Frontend เข้าไป
# เราจะก๊อปไฟล์จาก todo_frontend ไปไว้ในโฟลเดอร์ที่ Backend มองหา (static/build)
RUN mkdir -p static/build
COPY TODO/todo_frontend/public/ static/build/
# ก๊อปปี้ไฟล์ index.html หลักเข้าไป (ตัวที่ Error ฟ้องว่าหาไม่เจอ)
COPY TODO/todo_frontend/public/index.html static/build/index.html

EXPOSE 5000

CMD ["node", "server.js"]