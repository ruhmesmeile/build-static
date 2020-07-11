FROM node:12

WORKDIR /data

ONBUILD ADD ["package.json", "package-lock.json", ".npmrc", "/data/"]
ONBUILD RUN rm -rf /data/node_modules && npm set registry "https://verdaccio.ruhmesmeile.tools" && npm ci && npm cache clean --force
