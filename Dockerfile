# Start from Node (we'll build n8n from source)
FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Copy project files
COPY . .

# Install core dependencies
RUN npm install

# Install the custom Discord Trigger node
RUN npm install @binodev/n8n-nodes-discord-trigger

# Build n8n (TypeScript)
RUN npm run build

# Expose default n8n port
EXPOSE 5678

# Start n8n
CMD ["npm", "run", "start"]
