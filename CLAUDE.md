# CLAUDE.md - AI Assistant Guide for Solar Visual Website Builder

## Project Overview

Solar Visual Website Builder is an advanced visual website builder with drag-and-drop functionality and real-time preview. It enables users to build websites through an intuitive interface with instant visual feedback.

**Status**: Production (Version 1.0.151)

## Tech Stack

### Frontend
- **Framework**: React 18.3.1, TypeScript 5.6.2
- **Build Tool**: Vite 6.0.5
- **UI Components**: Radix UI (complete set), Shadcn/ui
- **Styling**: Tailwind CSS 3.4.17
- **Animation**: Framer Motion 11.0.3
- **3D Graphics**: Three.js 0.174.0, React Three Fiber, Drei
- **Charts**: Recharts 2.15.1, D3.js 7.9.0
- **Forms**: React Hook Form 7.54.2, Zod validation
- **Routing**: React Router DOM 7.1.3
- **Drag & Drop**: Hello Pangea DnD
- **Package Manager**: pnpm 9.15.0

### Backend
- **Framework**: Python FastAPI
- **Package Manager**: uv
- **Testing**: pytest, mypy

### Deployment
- Docker (Railway and e2b platforms)
- GitHub Actions CI/CD

## Project Structure

```
solar-visual-website-builder/
├── app/                    # React Frontend Application
│   ├── src/               # Source code
│   │   ├── components/    # UI and builder components
│   │   ├── hooks/         # Custom React hooks
│   │   ├── lib/           # Utilities & SDK
│   │   ├── types/         # TypeScript definitions
│   │   └── auth/          # Authentication
│   ├── public/            # Static assets
│   ├── package.json       # Frontend dependencies
│   ├── vite.config.ts     # Vite configuration
│   ├── tsconfig.json      # TypeScript config
│   └── eslint.config.js   # ESLint configuration
├── services/              # Python Backend Services
│   ├── api/               # FastAPI endpoints
│   ├── core/              # Business logic
│   ├── solar/             # Solar-specific modules
│   └── pyproject.toml     # Python dependencies
├── logging-server/        # Centralized logging
├── .github/workflows/     # GitHub Actions CI/CD
├── e2b.Dockerfile         # E2B platform deployment
├── railway.Dockerfile     # Railway deployment
└── docker-compose.yml     # Docker composition
```

## Key Files

| File | Purpose |
|------|---------|
| `app/src/main.tsx` | React app entry point |
| `app/vite.config.ts` | Vite build configuration with JSX location plugin |
| `app/package.json` | Frontend dependencies and scripts |
| `app/eslint.config.js` | ESLint rules for TypeScript/React |
| `app/tailwind.config.js` | Tailwind CSS configuration |
| `app/tsconfig.json` | TypeScript project references |
| `services/pyproject.toml` | Python backend dependencies |
| `.github/workflows/ci.yml` | CI/CD pipeline configuration |

## Development Setup

### Prerequisites
- Node.js 21+
- pnpm 9.15.0
- Python 3.11+
- uv (Python package manager)
- Git
- Docker (optional)

### Quick Start

```bash
# Clone the repository
git clone https://github.com/mikeschlottig/Solar-Visual-Website-Builder-Production.git
cd Solar-Visual-Website-Builder-Production

# Frontend setup
cd app
pnpm install
pnpm dev
# Open http://localhost:5173

# Backend setup (separate terminal)
cd services
uv sync
uv run uvicorn main:app --reload --port 8000
```

### Docker Setup

```bash
# Using docker-compose
docker-compose up

# Or build individually
docker build -t solar-builder:1 -f railway.Dockerfile .
```

## Common Commands

### Frontend (run from /app directory)

```bash
# Development
pnpm dev                    # Start dev server (port 5173)
pnpm build                  # Build for development
pnpm build:prod             # Build for production
pnpm preview                # Preview production build

# Code Quality
pnpm lint                   # Run ESLint
pnpm lint:fix               # Fix ESLint issues
pnpm type-check             # TypeScript type checking
```

### Backend (run from /services directory)

```bash
# Development
uv sync                     # Install dependencies
uv run uvicorn main:app --reload  # Start dev server

# Testing
uv run pytest               # Run tests
uv run pytest -v            # Verbose output
uv run mypy .               # Type checking
```

## Testing

### Frontend
- **Linting**: ESLint with TypeScript and React plugins
- **Type Checking**: TypeScript strict mode

```bash
cd app
pnpm lint                   # Lint code
pnpm type-check             # Type check
```

### Backend
- **Framework**: pytest
- **Type Checking**: mypy

```bash
cd services
uv run pytest               # Run all tests
uv run mypy .               # Type check
```

### CI/CD Pipeline
GitHub Actions runs on push to `main`/`develop` and PRs to `main`:
- Frontend: type-check, lint, build
- Backend: pytest, mypy
- Deployment to staging (develop) and production (main)

## Code Conventions

### TypeScript/React

- Use TypeScript strict mode
- Prefer functional components with hooks
- Use Radix UI as base components
- Style with Tailwind CSS utility classes
- Use `cn()` helper for conditional classes

```typescript
interface ComponentProps {
  variant: 'primary' | 'secondary';
  onClick: () => void;
  children: React.ReactNode;
}

const Component: React.FC<ComponentProps> = ({ variant, onClick, children }) => {
  return (
    <button
      className={cn(
        'px-4 py-2 rounded-md',
        variant === 'primary' ? 'bg-primary' : 'bg-secondary'
      )}
      onClick={onClick}
    >
      {children}
    </button>
  );
};
```

### ESLint Rules
- `@typescript-eslint/no-unused-vars`: warn
- `@typescript-eslint/no-explicit-any`: warn
- `react-hooks/recommended`: enforced
- `react-refresh/only-export-components`: warn

### Python (Backend)

- Follow PEP 8 style guide
- Use type hints throughout
- Document with docstrings
- Use FastAPI best practices
- Pydantic models for validation

```python
from typing import Optional
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel

class ComponentCreate(BaseModel):
    name: str
    type: str
    properties: Optional[dict] = None

@router.post("/components/")
async def create_component(component: ComponentCreate):
    """Create a new component."""
    return await service.create(component)
```

### Commit Messages
Use conventional commits:
```bash
feat: add new drag-and-drop feature
fix: resolve layout issue
docs: update API documentation
test: add component tests
```

## Path Aliases

The frontend uses `@` as an alias for `./src`:
```typescript
import { Button } from '@/components/ui/button';
import { useAuth } from '@/auth/AuthProvider';
```

## Environment Configuration

The app connects to a backend API:
- Development: `https://localhost:8000`
- Production: Dynamic based on hostname

Authentication is handled via `AuthProvider` with:
- Client ID: `a0ad2108-2754-4f39-a179-a2d963b86013`
- Base URL: `api.solarapp.dev`

## When Making Changes

1. **Follow existing patterns** - Check similar components in the codebase
2. **Use TypeScript** - Add proper interfaces and type hints
3. **Use Radix UI** - Build on existing component library
4. **Style with Tailwind** - Use utility classes, avoid custom CSS
5. **Run checks before committing**:
   ```bash
   cd app && pnpm lint && pnpm type-check
   ```
6. **Test accessibility** - Include ARIA labels, keyboard navigation
7. **Update documentation** - Document new APIs and components

## Deployment

### Railway
```bash
docker build -t solar-builder -f railway.Dockerfile .
```

### E2B Platform
```bash
docker build -t solar-builder -f e2b.Dockerfile .
```

### Production Build
```bash
cd app
pnpm build:prod
# Output in app/dist/
```

## Common Issues

- **Port conflicts**: Dev server uses 5173 (frontend) and 8000 (backend)
- **pnpm not found**: Install with `npm install -g pnpm`
- **uv not found**: Install with `pip install uv`
- **Type errors**: Run `pnpm type-check` to identify issues
- **Build failures**: Ensure all dependencies installed with `pnpm install --frozen-lockfile`

## External Resources

- Demo: https://solarapp.dev
- API Base: api.solarapp.dev
