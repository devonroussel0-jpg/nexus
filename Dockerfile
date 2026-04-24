FROM nginx:alpine

# Copie l'interface Stremio Web
RUN apk add --no-cache curl git

RUN git clone --depth 1 https://github.com/Stremio/stremio-web.git /usr/share/nginx/html

# Configuration personnalisée Nexus FR
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
