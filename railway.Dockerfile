# Railway Deployment Dockerfile
FROM node:21-slim as frontend-builder

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    python3-venv \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install pnpm
RUN npm install -g pnpm

# Build frontend
WORKDIR /app/frontend
COPY app/package.json app/pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

COPY app/ ./
RUN pnpm build

# Python backend stage
FROM python:3.11-slim as backend

# Install uv
RUN pip install uv

# Set working directory
WORKDIR /app

# Copy backend code
COPY services/ ./services/
COPY logging-server/ ./logging-server/

# Copy built frontend
COPY --from=frontend-builder /app/frontend/dist ./static

# Install Python dependencies
WORKDIR /app/services
RUN uv sync

# Expose port
EXPOSE $PORT

# Start the application
CMD ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "$PORT"]