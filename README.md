# Solar Visual Website Builder - Production

Advanced visual website builder with drag-and-drop functionality and real-time preview.

## Features

- **Visual Drag & Drop Builder**: Intuitive interface for building websites
- **Real-time Preview**: See changes instantly as you build
- **Modern React Stack**: Built with React 18, TypeScript, and Vite
- **Rich UI Components**: Comprehensive component library with Radix UI
- **Responsive Design**: Mobile-first approach with Tailwind CSS
- **Advanced Features**: 3D components, animations, and data visualization

## Tech Stack

- **Frontend**: React 18, TypeScript, Vite
- **UI Components**: Radix UI, Shadcn/ui
- **Styling**: Tailwind CSS
- **Animation**: Framer Motion
- **3D Graphics**: Three.js, React Three Fiber
- **Charts**: Recharts, D3.js
- **Forms**: React Hook Form, Zod validation

## Getting Started

1. Clone the repository
2. Navigate to the `app` directory
3. Install dependencies: `pnpm install`
4. Start development server: `pnpm dev`
5. Open http://localhost:5173 in your browser

## Project Structure

```
├── app/                 # Main React application
├── services/           # Backend services
├── logging-server/     # Logging infrastructure
└── .github/           # GitHub workflows
```

## Build for Production

```bash
cd app
pnpm build:prod
```

## Deployment

This project is configured for deployment on Railway and e2b platforms with included Docker configurations.

---

**LEVERAGE AI** - Advanced AI-Powered Website Builder