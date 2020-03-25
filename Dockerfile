FROM node:12

WORKDIR /data

ONBUILD ARG NPM_TOKEN

ONBUILD ADD ["package.json", "package-lock.json", "/data/"]
ONBUILD RUN rm -rf /data/node_modules && echo -e "//verdaccio.ruhmesmeile.tools/:_authToken=${NPM_TOKEN}" > /data/.npmrc && cat /data/.npmrc && npm install && rm /data/.npmrc
