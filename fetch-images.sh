#!/usr/bin/env bash
set -euo pipefail

mkdir -p assets/images

echo "Downloading real Porsche Cayenne generation photos from Wikimedia Commons..."

curl -fL --retry 3 \
  'https://upload.wikimedia.org/wikipedia/commons/9/90/Porsche-Cayenne.jpg' \
  -o assets/images/cayenne-955.jpg

curl -fL --retry 3 \
  'https://upload.wikimedia.org/wikipedia/commons/c/cb/2009_Porsche_Cayenne_%289PA_MY09%29_3.6_wagon_%282015-07-16%29_01.jpg' \
  -o assets/images/cayenne-957.jpg

curl -fL --retry 3 \
  'https://upload.wikimedia.org/wikipedia/commons/1/1f/Porsche_958_Cayenne_S_front.JPG' \
  -o assets/images/cayenne-958.jpg

curl -fL --retry 3 \
  'https://upload.wikimedia.org/wikipedia/commons/b/b7/Porsche_Cayenne_GTS_%282016%29_%2854871040001%29.jpg' \
  -o assets/images/cayenne-9582.jpg

if command -v sips >/dev/null 2>&1; then
  echo
  echo "Optimizing repository copies for GitHub (max 1600 px, JPEG quality 82)..."
  for image in assets/images/cayenne-955.jpg \
               assets/images/cayenne-957.jpg \
               assets/images/cayenne-958.jpg \
               assets/images/cayenne-9582.jpg; do
    tmp="${image%.jpg}.optimized.jpg"
    sips -Z 1600 -s format jpeg -s formatOptions 82 "$image" --out "$tmp" >/dev/null
    mv "$tmp" "$image"
  done
else
  echo
  echo "WARNING: macOS sips not found; photos were downloaded but not resized."
fi

echo
echo "Done:"
ls -lh assets/images/cayenne-955.jpg \
       assets/images/cayenne-957.jpg \
       assets/images/cayenne-958.jpg \
       assets/images/cayenne-9582.jpg
