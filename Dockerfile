# Stage 1: Build
FROM node:14 AS build

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Stage 2: Deployment
FROM node:14-alpine

WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=build /app /app

# Expose the application port
EXPOSE 3000


CMD ["npm", "start"]