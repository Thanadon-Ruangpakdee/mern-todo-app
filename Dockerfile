# Stage 1: Build Frontend
FROM node:18-alpine AS build-stage
WORKDIR /frontend
COPY TODO/todo_frontend/package*.json ./
RUN npm install
COPY TODO/todo_frontend/ .
RUN npm run build

# Stage 2: Setup Backend
FROM node:18-alpine
WORKDIR /app

# ติดตั้ง Backend Dependencies
COPY TODO/todo_backend/package*.json ./
RUN npm install

# ก๊อปปี้ไฟล์ Backend
COPY TODO/todo_backend/ .

# ก๊อปปี้ไฟล์หน้าเว็บที่ Build เสร็จแล้วจาก Stage 1 มาวางใน Path ที่ Backend ต้องการ
COPY --from=build-stage /frontend/build ./static/build

# ตั้งค่า Port ตามโจทย์ข้อ 3
EXPOSE 5000

CMD ["node", "server.js"]