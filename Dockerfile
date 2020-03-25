FROM node:12

WORKDIR /data

ONBUILD ARG NPM_AUTH
ONBUILD ENV NPM_TOKEN $NPM_AUTH

ONBUILD ADD ["package.json", "package-lock.json", "/data/"]
ONBUILD RUN rm -rf /data/node_modules && echo "//verdaccio.ruhmesmeile.tools/:_authToken=\${NPM_TOKEN}" >> /data/.npmrc && npm install
