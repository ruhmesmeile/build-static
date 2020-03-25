FROM node:12

WORKDIR /data

ONBUILD ADD ["package.json", "package-lock.json", "/data/"]
ONBUILD RUN rm -rf /data/node_modules && echo "//verdaccio.ruhmesmeile.tools/:_authToken=\${NPM_TOKEN}" >> /data/.npmrc && npm install
