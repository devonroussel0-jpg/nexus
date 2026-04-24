FROM node:18-slim

WORKDIR /app

# Installation des dépendances système
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Installation de MediaFusion + configuration FR
RUN pip3 install mediafusion

COPY start.sh .
RUN chmod +x start.sh

EXPOSE 8080

CMD ["./start.sh"]
