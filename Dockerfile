# Étape 1 : Build de stremio-web
FROM node:18-alpine AS builder

RUN apk add --no-cache git
RUN git clone --depth 1 https://github.com/Stremio/stremio-web.git /app

WORKDIR /app

# Renommer Stremio en Nexus
RUN find /app/src -type f -name "*.js" -o -name "*.jsx" | xargs sed -i 's/Stremio/Nexus/g'
RUN find /app -name "index.html" -exec sed -i 's/Stremio/Nexus/g' {} + || true
RUN find /app -name "index.html" -exec sed -i 's/stremio/nexus/g' {} + || true

# Remplacer le logo (si tu as ajouté logo.png dans ton repo)
COPY logo.png /app/public/images/logo.png

RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
