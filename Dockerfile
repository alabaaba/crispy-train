# Use Node 18
FROM node:18

WORKDIR /app

# Install server dependencies
COPY package*.json ./
RUN npm install

# Copy backend + frontend
COPY backend ./backend
COPY frontend ./frontend

# Build frontend
RUN cd frontend && npm install && npm run build

# Expose port
EXPOSE 8080

# Start server
CMD ["node", "backend/index.js"]
