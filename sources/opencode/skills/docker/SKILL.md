---
name: docker
description: Docker containerization - images, containers, volumes, networking, docker-compose, best practices
metadata:
  language: bash
  audience: developers
---

## Overview

Docker is a platform for developing, shipping, and running applications in containers. Use this skill when working with Docker or Docker Compose.

## Installation

### Docker Engine

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group
sudo usermod -aG docker $USER
```

### Docker Compose

```bash
# Standalone (recommended)
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

Verify installation:
```bash
docker --version
docker-compose --version
```

## Basic Concepts

### Images

- **Image**: A read-only template for creating containers
- **Container**: A runnable instance of an image
- **Tag**: Version identifier for images (e.g., `nginx:latest`)
- **Registry**: Storage for images (Docker Hub, GHCR, ECR, etc.)

### Common Commands

```bash
# List images
docker images
docker image ls

# Pull an image
docker pull nginx:latest

# Remove an image
docker rmi nginx:latest

# Build an image from Dockerfile
docker build -t myapp:latest .

# Tag an image
docker tag myapp:latest registry.io/myapp:latest

# Push to registry
docker push registry.io/myapp:latest
```

## Docker Contexts

Docker contexts allow you to manage connections to multiple Docker hosts from a single Docker CLI. Useful for switching between local Docker, remote servers, or Kubernetes clusters.

### Basic Context Management

```bash
# List all contexts
docker context ls

# Show current context
docker context show

# Use a specific context
docker context use my-remote-host

# Create a new context
docker context create my-remote-host \
  --docker "host=ssh://user@remote-server:22"

# Create context from existing Docker configuration
docker context create my-context --docker "host=tcp://localhost:2375"

# Inspect a context
docker context inspect my-remote-host

# Remove a context
docker context rm my-remote-host
```

### SSH Context

Connect to a remote Docker host via SSH:

```bash
# Create SSH context
docker context create production \
  --docker "host=ssh://user@production-server"

# Use the context
docker context use production
docker ps
docker run -d nginx:latest
```

### Kubernetes Context

```bash
# List Kubernetes contexts (requires kubectl)
kubectl config get-contexts

# Create Docker context from Kubernetes context
docker context create k8s-prod \
  --kubernetes "context-name=production"

# Switch to Kubernetes context
docker context use k8s-prod
```

### Use with Docker Compose

```bash
# Use a specific context with compose
docker --context my-remote-host compose up -d

# Or set context in compose file (Docker Compose v2)
COMPOSE_DOCKER_CLI_HOST=1 docker compose up -d
```

### Best Practices

1. **Name meaningfully** - Use prefixes like `local-`, `prod-`, `dev-`
2. **Test before switching** - Use `docker context inspect` to verify
3. **Keep local default** - Keep `default` or `local` for local development
4. **Document remote connections** - Note SSH keys and endpoints

```bash
# Example context setup
docker context create local     # Local Docker (default)
docker context create dev-server --docker "host=ssh://dev@dev-server"
docker context create prod-server --docker "host=ssh://prod@prod-server"

# Quick switch
docker context use dev-server
```

## Dockerfile

### Best Practices

1. **Use multi-stage builds** - Reduce final image size
2. **Order commands by change frequency** - Cache unchanged layers
3. **Use specific tags** - Avoid `latest` in production
4. **Use .dockerignore** - Exclude unnecessary files
5. **Run as non-root** - Security best practice
6. **Use official base images** - Better security and maintenance

### Node.js Example

```dockerfile
# Build stage
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Production stage
FROM node:20-alpine AS production
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
USER node
EXPOSE 3000
CMD ["node", "dist/index.js"]
```

### Python Example

```dockerfile
FROM python:3.11-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:3.11-slim
WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY . .
ENV PATH=/root/.local/bin:$PATH
EXPOSE 8000
CMD ["python", "main.py"]
```

### .dockerignore

```
node_modules
.git
.gitignore
.env
.env.*
README.md
dist
build
coverage
*.log
.DS_Store
```

## Containers

### Run a Container

```bash
# Run in background (detached)
docker run -d myapp:latest

# Run with port mapping
docker run -d -p 8080:3000 myapp:latest

# Run with volume mount
docker run -d -v /host/path:/container/path myapp:latest

# Run with environment variables
docker run -d -e NODE_ENV=production -e API_KEY=xxx myapp:latest

# Run with name
docker run -d --name my-container myapp:latest

# Interactive mode
docker run -it ubuntu:latest /bin/bash

# Remove container after exit
docker run --rm myapp:latest
```

### Container Management

```bash
# List running containers
docker ps

# List all containers
docker ps -a

# Stop a container
docker stop my-container

# Start a stopped container
docker start my-container

# Restart a container
docker restart my-container

# Remove a container
docker rm my-container

# Remove all stopped containers
docker container prune

# View logs
docker logs -f my-container

# Execute command in running container
docker exec -it my-container sh

# Inspect container details
docker inspect my-container

# View resource usage
docker stats my-container
```

## Volumes

### Named Volumes

```bash
# Create a volume
docker volume create my-data

# List volumes
docker volume ls

# Inspect volume
docker volume inspect my-data

# Remove volume
docker volume rm my-data
```

### Bind Mounts

```bash
# Mount host directory
docker run -v /host/path:/container/path myapp:latest

# Mount read-only
docker run -v /host/path:/container/path:ro myapp:latest
```

### Use in Dockerfile

```dockerfile
VOLUME /app/data
```

## Networking

### Networks

```bash
# Create a network
docker network create my-network

# List networks
docker network ls

# Connect container to network
docker network connect my-network my-container

# Disconnect container from network
docker network disconnect my-network my-container
```

### Port Exposure

```dockerfile
EXPOSE 3000 8080
```

## Docker Compose

### Basic Structure

```yaml
version: '3.8'

services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
    volumes:
      - ./data:/app/data
    depends_on:
      - db
    restart: unless-stopped

  db:
    image: postgres:15-alpine
    environment:
      POSTGRES_DB: myapp
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
    volumes:
      - db-data:/var/lib/postgresql/data
    restart: unless-stopped

volumes:
  db-data:
```

### Common Commands

```bash
# Start services
docker-compose up -d

# Start with build
docker-compose up -d --build

# Stop services
docker-compose down

# Stop and remove volumes
docker-compose down -v

# View logs
docker-compose logs -f

# List services
docker-compose ps

# Execute command in service
docker-compose exec app sh

# Scale a service
docker-compose up -d --scale app=3
```

### Healthchecks

```yaml
services:
  app:
    build: .
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000/health"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s
```

### Profiles

```yaml
services:
  app:
    build: .
  
  debug:
    build: .
    profiles:
      - debug
    command: ["sleep", "infinity"]
```

Run with profile: `docker-compose --profile debug up`

## Development

### Development with Volumes

```yaml
services:
  app:
    build:
      context: .
      target: development
    volumes:
      - .:/app
      - /app/node_modules
    environment:
      - NODE_ENV=development
    command: npm run dev
```

### Hot Reload

For Node.js with nodemon:
```dockerfile
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "run", "dev"]
```

## Security Best Practices

1. **Don't run as root** - Use `USER` directive
2. **Scan for vulnerabilities** - Use `docker scout` or `trivy`
3. **Use specific tags** - Not `latest`
4. **Read-only containers** - Use `--read-only` flag
5. **Limit capabilities** - Use `--cap-drop` and `--cap-add`
6. **Secrets management** - Use Docker secrets or environment variables
7. **Multi-stage builds** - Minimize attack surface

```bash
# Security scanning
docker scout cves myapp:latest

# Run securely
docker run \
  --read-only \
  --cap-drop ALL \
  --user 1000:1000 \
  myapp:latest
```

## Debugging

```bash
# Interactive shell
docker run -it --rm myapp:latest sh

# Inspect with dive (if installed)
dive myapp:latest

# Check layers
docker history myapp:latest

# Debug running container
docker exec sh

# Copy files from -it my-container container
docker cp my-container:/app/logs ./logs
```

## Common Patterns

### Node.js + Nginx

```yaml
services:
  app:
    build: ./app
    expose:
      - "3000"
  
  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
    depends_on:
      - app
```

### Database + Backup

```yaml
services:
  db:
    image: postgres:15-alpine
    volumes:
      - db-data:/var/lib/postgresql/data
  
  backup:
    image: postgres:15-alpine
    volumes:
      - ./backups:/backups
    command: >
      sh -c "while true; do
        pg_dump -h db -U postgres mydb > /backups/backup-$$(date +%Y%m%d-%H%M%S).sql;
        sleep 86400;
      done"
    depends_on:
      - db
```

## Tips

- Use `docker system prune -a` to clean up unused resources
- Use `--force-rm` when building to remove intermediate containers
- Use `-f` flag to force operations
- Use `--no-cache` for clean builds
- Tag images before pushing to registries
- Use `docker-compose config` to validate compose files
