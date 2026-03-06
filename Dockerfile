# Use a lightweight Node image
FROM node:20-bookworm-slim
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy all files and build the Astro project
COPY . .
RUN npm run build

# Install 'serve' globally to handle static routing
RUN npm install -g serve

# Explicitly expose port 8080
EXPOSE 8080

# Serve the dist folder exactly on port 8080
CMD ["serve", "-s", "dist", "-l", "8080"]