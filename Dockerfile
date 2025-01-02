# Gunakan Node.js sebagai base image
FROM node:alpine

# Set direktori kerja di dalam container
WORKDIR /app

# Salin file proyek ke dalam container
COPY . .

# Install http-server secara global
RUN npm install -g http-server

# Install dependencies jika ada package.json
RUN npm install

# Expose port 8081
EXPOSE 8081

# Jalankan aplikasi menggunakan npm start
CMD ["npm", "start"]