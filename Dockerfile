FROM node:18

WORKDIR /usr/src/app

# Install pnpm globally
RUN npm install -g pnpm

# Copy relevant files
COPY . .

# Install dependencies with pnpm
RUN pnpm install

# Add Discord Trigger node
RUN pnpm add @binodev/n8n-nodes-discord-trigger

# Build n8n
RUN pnpm run build

EXPOSE 5678

CMD ["pnpm", "start"]
