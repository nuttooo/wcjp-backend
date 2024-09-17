# ใช้ Node.js เป็น base image
FROM node:18-alpine

# ตั้ง working directory ใน container
WORKDIR /usr/src/app

# คัดลอกไฟล์ package.json และ package-lock.json เข้ามาใน container
COPY package*.json ./

# ติดตั้ง dependencies
RUN npm install --production

# คัดลอก source code ทั้งหมดเข้าไปใน container
COPY . .

# คอมไพล์ TypeScript (ถ้าจำเป็น)
RUN npm run build

# เปิดพอร์ต 3200 ใน container
EXPOSE 3200

# สั่งให้รันแอปเมื่อ container เริ่มต้น
CMD ["npm", "run", "start:prod"]
