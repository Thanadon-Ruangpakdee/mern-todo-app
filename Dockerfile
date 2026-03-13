# 1. Use lightweight image
FROM node:18-alpine

# 2. Set working directory
WORKDIR /app

# 3. Copy package files and install dependencies
# เราต้องชี้ไปที่ folder todo_backend เพราะ server อยู่ที่นั่น
COPY TODO/todo_backend/package*.json ./
RUN npm install

# 4. Copy the rest of the application
COPY . .

# 5. Move to the backend directory to run the app
WORKDIR /app/TODO/todo_backend

# 6. Expose port 5000 as per exam requirement
EXPOSE 5000

# 7. Start the application
CMD ["node", "server.js"]