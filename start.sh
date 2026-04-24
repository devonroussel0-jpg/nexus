#!/bin/bash

echo "======================================="
echo "     NEXUS V2 - VERSION FR NUCLÉAIRE    "
echo "     Créé spécialement pour toi         "
echo "======================================="

# Configuration MediaFusion en mode FR ultra puissant
cat > /config/config.json << EOF
{
  "port": 8080,
  "host": "0.0.0.0",
  "language": ["fr", "vf", "vostfr"],
  "quality": ["2160p", "1080p", "720p"],
  "streaming_providers": ["yggtorrent", "torrent9", "1337x", "french-stream", "wiflix", "papystreaming"],
  "debrid": true,
  "real_debrid": true,
  "all_debrid": true,
  "anime": true,
  "series": true,
  "movies": true
}
EOF

echo "🚀 Lancement de ton Nexus personnel..."
mediafusion --config /config/config.json
