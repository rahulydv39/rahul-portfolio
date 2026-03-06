import { defineConfig } from 'astro/config';
import tailwind from "@astrojs/tailwind";

// https://astro.build/config
export default defineConfig({
  integrations: [tailwind()],
  // ADD THIS VITE BLOCK BELOW
  vite: {
    preview: {
      allowedHosts: true,
    }
  }
});