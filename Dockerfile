# Gunakan Node.js sebagai base image
FROM node:alpine

# Set direktori kerja di dalam container
WORKDIR /app

# Salin file proyek ke dalam container
COPY . .

# Install http-server secara global
RUN npm install -g http-server

# Expose port 8080
EXPOSE 8080

# Jalankan http-server
CMD ["http-server", "/app", "-p", "8080"]