FROM node:20-bookworm-slim
WORKDIR /app

# Install dependencies and build
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Expose Port 3000 as suggested by Kuberns
EXPOSE 3000

# Run Astro's native preview server
CMD ["npx", "astro", "preview", "--host", "0.0.0.0", "--port", "3000"]