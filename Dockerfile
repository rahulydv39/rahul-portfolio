# Stage 1: Build the Astro site (Upgraded to node 20)
FROM node:20-slim AS build
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install standard dependencies
RUN npm install

# THE FIX: Forcefully install the specific Linux ARM64 engine that npm skips on Macs
RUN npm install @tailwindcss/oxide-linux-arm64-gnu

# Copy the rest of the code
COPY . .

# Run the build
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine
# Copy the built static files from the Astro dist folder to Nginx
COPY --from=build /app/dist /usr/share/nginx/html
# Expose port 80
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]