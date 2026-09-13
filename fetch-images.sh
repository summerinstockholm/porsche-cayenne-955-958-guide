#!/usr/bin/env bash
set -euo pipefail

mkdir -p assets/images

echo "Downloading Porsche Cayenne generation photos from Wikimedia Commons..."

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

echo
echo "Done:"
ls -lh assets/images/cayenne-955.jpg \
       assets/images/cayenne-957.jpg \
       assets/images/cayenne-958.jpg \
       assets/images/cayenne-9582.jpg
