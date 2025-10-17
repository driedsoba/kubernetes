# Use lean image
FROM node:22-alpine AS base
WORKDIR /app

# Install dependencies
COPY package*.json package-lock.json* ./
RUN npm ci --omit=dev

# Copy source code
COPY . .

# Run as non root
USER node
EXPOSE 3000
ENV NODE_ENV=production
CMD ["npm", "start"]