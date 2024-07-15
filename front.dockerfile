# Use the official Node.js image as the base image
FROM node:16

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the app
RUN npm run build

# Serve the app using a static file server
RUN npm install
CMD ["npm", "run", "dev"]

# Expose the port the app runs on
EXPOSE 3000