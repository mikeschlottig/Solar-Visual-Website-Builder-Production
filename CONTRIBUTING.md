# Contributing to Solar Visual Website Builder

Thank you for your interest in contributing to the Solar Visual Website Builder! This guide will help you get started.

## 🏗️ Development Setup

### Prerequisites
- Node.js 21+ and pnpm
- Python 3.11+ and uv
- Git
- Docker (optional)

### Clone and Setup
```bash
git clone https://github.com/mikeschlottig/Solar-Visual-Website-Builder-Production.git
cd Solar-Visual-Website-Builder-Production

# Frontend setup
cd app
pnpm install

# Backend setup
cd ../services
uv sync
```

## 🎯 Project Structure

```
app/                    # React Frontend
├── src/
│   ├── components/     # UI Components
│   ├── lib/           # Utilities & SDK
│   ├── hooks/         # Custom React Hooks
│   └── types/         # TypeScript Definitions
├── public/            # Static Assets
└── package.json       # Frontend Dependencies

services/              # Python Backend
├── api/              # FastAPI Routes
├── core/             # Business Logic
├── solar/            # Solar-specific Modules
└── pyproject.toml    # Python Dependencies

logging-server/       # Logging Service
```

## 🧪 Testing

### Frontend Tests
```bash
cd app
pnpm test                # Unit tests
pnpm test:e2e           # End-to-end tests
pnpm lint               # Linting
pnpm type-check         # TypeScript checking
```

### Backend Tests
```bash
cd services
uv run pytest          # Run all tests
uv run pytest -v       # Verbose output
uv run coverage run     # Coverage report
```

## 📝 Code Style

### Frontend (TypeScript/React)
- Use TypeScript strict mode
- Follow React hooks best practices
- Use Tailwind CSS for styling
- Prefer functional components
- Use meaningful component and variable names

```typescript
// Good
interface ButtonProps {
  variant: 'primary' | 'secondary';
  onClick: () => void;
  children: React.ReactNode;
}

const Button: React.FC<ButtonProps> = ({ variant, onClick, children }) => {
  return (
    <button 
      className={cn(
        'px-4 py-2 rounded-md font-medium',
        variant === 'primary' ? 'bg-primary text-primary-foreground' : 'bg-secondary text-secondary-foreground'
      )}
      onClick={onClick}
    >
      {children}
    </button>
  );
};
```

### Backend (Python)
- Follow PEP 8 style guide
- Use type hints
- Document functions with docstrings
- Use FastAPI best practices

```python
from typing import List, Optional
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel

class ComponentCreate(BaseModel):
    name: str
    type: str
    properties: Optional[dict] = None

@router.post("/components/", response_model=Component)
async def create_component(component: ComponentCreate) -> Component:
    """Create a new component in the website builder."""
    try:
        return await component_service.create(component)
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))
```

## 🎨 UI/UX Guidelines

### Design System
- Use Radix UI components as base
- Follow the established color scheme
- Maintain consistent spacing (Tailwind scale)
- Ensure accessibility (ARIA labels, keyboard navigation)

### Component Creation
1. Create in appropriate directory (`components/ui/` for reusable, `components/builder/` for builder-specific)
2. Include TypeScript interfaces
3. Add proper documentation
4. Test accessibility

## 🚀 Submission Process

### 1. Fork and Branch
```bash
git fork https://github.com/mikeschlottig/Solar-Visual-Website-Builder-Production.git
git checkout -b feature/your-feature-name
```

### 2. Development
- Write clean, documented code
- Add tests for new features
- Update documentation if needed
- Test thoroughly

### 3. Commit Guidelines
Use conventional commits:
```bash
git commit -m "feat: add drag-and-drop component positioning"
git commit -m "fix: resolve responsive layout issues"
git commit -m "docs: update deployment guide"
git commit -m "test: add component interaction tests"
```

### 4. Pull Request
- Create detailed PR description
- Link related issues
- Add screenshots for UI changes
- Ensure CI passes

## 🐛 Bug Reports

When reporting bugs, include:
- Clear description of the issue
- Steps to reproduce
- Expected vs actual behavior
- Browser/OS information
- Screenshots/videos if applicable

## 💡 Feature Requests

For new features:
- Describe the use case
- Explain the proposed solution
- Consider alternative approaches
- Discuss implementation complexity

## 📚 Documentation

- Update README.md for major changes
- Document new APIs in code
- Update deployment guides
- Add inline code comments

## 🤝 Community

- Be respectful and inclusive
- Help others in discussions
- Share knowledge and best practices
- Collaborate constructively

## 📄 License

By contributing, you agree that your contributions will be licensed under the same license as the project.

---

**Questions?** Open an issue or start a discussion!