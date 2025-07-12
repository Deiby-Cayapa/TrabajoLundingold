import { defineConfig } from 'vite';

export default defineConfig({
  server: {
    host: true,
    port: 4200,
    allowedHosts: ['.ngrok-free.app'], // permite todos los subdominios de Ngrok
  }
});
