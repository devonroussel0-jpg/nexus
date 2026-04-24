#!/bin/bash
echo "======================================="
echo "     NEXUS V2 - VERSION FR PERSONNEL    "
echo "     Créé pour devonroussel0-jpg        "
echo "======================================="

echo "🚀 Démarrage de Nexus..."

# Lancement de MediaFusion en mode FR
mediafusion \
  --host 0.0.0.0 \
  --port 8080 \
  --languages fr,vf,vostfr \
  --qualities 2160p,1080p,720p \
  --add-streaming-providers french-stream,wiflix,papystreaming,hdss \
  --add-torrent-providers yggtorrent,torrent9
