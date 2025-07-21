# Solar Visual Website Builder - Project Structure

## 📁 Directory Overview

```
solar-visual-website-builder/
├── app/                    # React Frontend Application
│   ├── src/               # Source code
│   │   ├── components/    # Reusable UI components
│   │   ├── hooks/         # Custom React hooks
│   │   ├── lib/           # Utility libraries
│   │   ├── types/         # TypeScript definitions
│   │   └── assets/        # Static assets
│   ├── public/            # Public assets
│   └── package.json       # Frontend dependencies
├── services/              # Python Backend Services
│   ├── api/               # API endpoints
│   ├── core/              # Core business logic
│   ├── solar/             # Solar-specific modules
│   └── pyproject.toml     # Python dependencies
├── logging-server/        # Centralized logging
├── .github/               # GitHub Actions workflows
├── e2b.Dockerfile         # E2B deployment
├── railway.Dockerfile     # Railway deployment
└── README.md              # Project documentation
```

## 🏗️ Architecture

### Frontend (React + TypeScript)
- **Framework**: React 18 with TypeScript
- **Build Tool**: Vite for fast development
- **UI Library**: Radix UI components
- **Styling**: Tailwind CSS
- **Animation**: Framer Motion
- **3D Graphics**: Three.js with React Three Fiber
- **State Management**: React hooks and context
- **Drag & Drop**: Hello Pangea DnD

### Backend (Python FastAPI)
- **Framework**: FastAPI for high-performance APIs
- **Architecture**: Modular service-based design
- **Documentation**: Auto-generated OpenAPI/Swagger
- **Deployment**: Docker containers

### Deployment Options
1. **E2B Platform**: Optimized for microVM deployment
2. **Railway**: Full-stack deployment platform
3. **Local Development**: Complete development environment

## 🚀 Key Features

- **Visual Website Builder**: Drag-and-drop interface
- **Real-time Preview**: Instant visual feedback
- **Component Library**: Extensive UI component collection
- **Template System**: Pre-built templates and themes
- **Export Functionality**: Generate production-ready code
- **Version Control**: Built-in versioning system

## 📦 Dependencies

### Frontend Core
- React 18.3.1
- TypeScript 5.6.2
- Vite 6.0.5
- Tailwind CSS 3.4.17

### UI & Interaction
- Radix UI (complete component set)
- Framer Motion 11.0.3
- Lucide React 0.474.0
- React Hook Form 7.54.2

### Advanced Features
- Three.js 0.174.0
- React Three Fiber & Drei
- D3.js 7.9.0
- Recharts 2.15.1

### Development Tools
- ESLint 9.17.0
- Autoprefixer 10.4.20
- TypeScript ESLint 8.18.2

---

*Version 1.0.151 - Production Ready*