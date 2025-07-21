# Solar Visual Website Builder - Deployment Guide

## 🚀 Deployment Options

### 1. E2B Platform (Recommended)

E2B provides optimized microVM deployment for Solar applications.

```bash
# Build and deploy to E2B
docker build -f e2b.Dockerfile -t solar-website-builder .
e2b deploy solar-website-builder
```

**Features:**
- Optimized for microVM architecture
- Automatic scaling
- Built-in monitoring
- Fast cold starts

### 2. Railway Platform

One-click deployment to Railway with automatic builds.

```bash
# Deploy to Railway
railway login
railway link
railway up
```

**Configuration:**
- Uses `railway.Dockerfile`
- Automatic SSL certificates
- Custom domains supported
- Environment variables via Railway dashboard

### 3. Local Development

```bash
# Frontend (React + Vite)
cd app
pnpm install
pnpm dev  # Runs on http://localhost:5173

# Backend (Python FastAPI)
cd services
uv sync
uv run uvicorn main:app --reload  # Runs on http://localhost:8000

# Logging Server
cd logging-server
uv run uvicorn main:app --port 8001  # Runs on http://localhost:8001
```

### 4. Docker Compose (Full Stack)

```bash
# Run entire stack
docker-compose up --build

# Services available at:
# Frontend: http://localhost:5173
# Backend API: http://localhost:8000
# Logging: http://localhost:8001
```

## 🔧 Environment Variables

### Frontend (.env)
```env
VITE_API_URL=http://localhost:8000
VITE_APP_TITLE=Solar Visual Website Builder
VITE_CLIENT_ID=your-client-id
VITE_BASE_INFRANODE_URL=api.solarapp.dev
VITE_LOGIN_REDIRECT_URL=https://solarapp.dev/external-login
```

### Backend (.env)
```env
ENVIRONMENT=production
API_HOST=0.0.0.0
API_PORT=8000
CORS_ORIGINS=https://yourdomain.com,https://app.yourdomain.com
DATABASE_URL=your-database-url
SECRET_KEY=your-secret-key
```

## 📦 Production Build

### Frontend Optimization
```bash
cd app
pnpm build:prod

# Output: dist/ directory
# Contains optimized, minified assets
# Ready for CDN deployment
```

### Backend Production
```bash
cd services
uv run uvicorn main:app --host 0.0.0.0 --port 8000 --workers 4
```

## 🔍 Health Checks

- **Frontend**: `http://localhost:5173/` (returns app)
- **Backend API**: `http://localhost:8000/health` (returns status)
- **API Docs**: `http://localhost:8000/docs` (Swagger UI)
- **Logging**: `http://localhost:8001/health` (returns status)

## 📊 Monitoring

### Logs
- Frontend: Browser DevTools Console
- Backend: `logs/api.log`
- Logging Server: `logs/logging.log`

### Metrics
- API response times
- Error rates
- User interactions
- Build performance

## 🔒 Security

### HTTPS/SSL
- Railway: Automatic SSL certificates
- E2B: Built-in SSL termination
- Local: Use reverse proxy (nginx/caddy)

### CORS Configuration
```python
# services/main.py
app.add_middleware(
    CORSMiddleware,
    allow_origins=["https://yourdomain.com"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

## 🚨 Troubleshooting

### Common Issues

1. **Port Conflicts**
   ```bash
   lsof -i :5173  # Check if port is in use
   kill -9 <PID>  # Kill process using port
   ```

2. **Build Failures**
   ```bash
   rm -rf node_modules pnpm-lock.yaml
   pnpm install
   ```

3. **Backend Connection Issues**
   - Check API URL in frontend config
   - Verify CORS settings
   - Check network connectivity

### Debug Mode
```bash
# Frontend with debug
VITE_DEBUG=true pnpm dev

# Backend with debug
DEBUG=true uv run uvicorn main:app --reload --log-level debug
```

---

**Need Help?** Check the [GitHub Issues](../../issues) or [Documentation](README.md)