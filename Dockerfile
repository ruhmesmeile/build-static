FROM node:12

WORKDIR /data

ONBUILD RUN mkdir -p /data/patches
ONBUILD ADD ["package.json", "package-lock.json", ".npmrc", "/data/"]
ONBUILD ADD ["patches", "/data/patches"]
ONBUILD RUN ls -lah /data/ && ls -lah /data/patches && rm -rf /data/node_modules && npm set registry "https://verdaccio.ruhmesmeile.tools" && PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true npm ci && npm cache clean --force
