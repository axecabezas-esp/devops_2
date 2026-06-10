# --- ETAPA 1: Construcción de la App ---
    FROM node:20-alpine AS build

    WORKDIR /app
    
    COPY package*.json ./
    RUN npm install
    COPY . .
    
    # ---> AÑADE ESTAS LÍNEAS AQUÍ <---
    ARG VITE_API_URL
    ENV VITE_API_URL=$VITE_API_URL
    
    # Ahora al compilar, Vite absorberá la IP de AWS Academy correctamente
    RUN npm run build
    
    # --- ETAPA 2: Servidor de Producción ---   
    FROM nginx:1.25-alpine
    COPY --from=build /app/dist /usr/share/nginx/html
    EXPOSE 80
    CMD ["nginx", "-g", "daemon off;"]