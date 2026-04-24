# Étape 1 : Build de stremio-web
FROM node:18-alpine AS builder

RUN apk add --no-cache git
RUN git clone --depth 1 https://github.com/Stremio/stremio-web.git /app

WORKDIR /app
RUN npm install
RUN npm run build

# Étape 2 : Servir avec nginx
FROM nginx:alpine

# Copie les fichiers buildés
COPY --from=builder /app/build /usr/share/nginx/html

# Config nginx personnalisée
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
