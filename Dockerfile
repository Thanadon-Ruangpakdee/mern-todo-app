FROM node:18-alpine

WORKDIR /app

# 1. ก๊อปปี้ไฟล์ package จาก backend มาลงที่ root ของ /app
COPY TODO/todo_backend/package*.json ./
RUN npm install

# 2. ก๊อปปี้ทุกอย่างจากใน todo_backend มาไว้ที่ /app เลย (ไม่ต้องซ้อนโฟลเดอร์ TODO)
COPY TODO/todo_backend/ .

# 3. เช็กว่าโฟลเดอร์ static อยู่ที่นี่ไหม ถ้ามีให้ก๊อปมาด้วย
# ปกติ COPY . . จะเอามาหมดแล้ว

EXPOSE 5000

# รันจาก /app ได้เลยเพราะเราก๊อปไฟล์มาไว้ที่นี่แล้ว
CMD ["node", "server.js"]