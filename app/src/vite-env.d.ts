/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly VITE_API_URL: string
  readonly VITE_APP_TITLE: string
  readonly VITE_CLIENT_ID: string
  readonly VITE_BASE_INFRANODE_URL: string
  readonly VITE_LOGIN_REDIRECT_URL: string
}

interface ImportMeta {
  readonly env: ImportMetaEnv
}