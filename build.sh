#!/bin/bash
# Builds the single self-contained HTML file (logo embedded as base64).
set -e
cd "$(dirname "$0")"
B64=$(base64 -i client_files/logo/logo-dark.jpeg | tr -d '\n')
mkdir -p dist
python3 -c "
import sys
src=open('src/app.html').read()
open('dist/index.html','w').write(src.replace('__LOGO__','data:image/jpeg;base64,'+sys.argv[1]))
" "$B64"
mkdir -p docs && cp dist/index.html docs/index.html
echo "Built dist/index.html ($(du -h dist/index.html | cut -f1))"
