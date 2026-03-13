# ใช้ Node Alpine ตามคำสั่ง
FROM node:18-alpine

WORKDIR /app

# ก๊อปปี้ package files เข้าไปติดตั้งก่อน
COPY TODO/todo_backend/package*.json ./
RUN npm install

# ก๊อปปี้โค้ดที่เหลือ (ตรวจสอบว่า path todo_backend ถูกต้องตาม repo ที่ fork มา)
COPY . .

# ย้ายไปโฟลเดอร์ที่มี server.js
WORKDIR /app/TODO/todo_backend

# สำคัญ: ต้องเป็นพอร์ต 5000 ตามโจทย์ข้อ 3
EXPOSE 5000

CMD ["node", "server.js"]