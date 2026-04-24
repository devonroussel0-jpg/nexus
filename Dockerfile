FROM python:3.11-slim

WORKDIR /app

# Installation des paquets système
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Installation de Stremio Web + configuration FR
RUN git clone --depth 1 https://github.com/Stremio/stremio-web.git /app/stremio-web

# Installation des dépendances
RUN curl -fsSL https://github.com/muhammederkan/mediafusion/releases/latest/download/mediafusion-linux-amd64 > /usr/local/bin/mediafusion && \
    chmod +x /usr/local/bin/mediafusion

COPY start.sh .
RUN chmod +x start.sh

EXPOSE 8080

CMD ["./start.sh"]
