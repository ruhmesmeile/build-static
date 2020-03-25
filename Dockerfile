FROM node:12

WORKDIR /data

ONBUILD ARG NPM_TOKEN

ONBUILD ADD ["package.json", "package-lock.json", "/data/"]
ONBUILD RUN rm -rf /data/node_modules && echo "//verdaccio.ruhmesmeile.tools/:_authToken=${NPM_TOKEN}" > /data/.npmrc && echo "//verdaccio.ruhmesmeile.tools/:_authToken=${NPM_TOKEN}" > ~/.npmrc && cat /data/.npmrc && ls -lah && npm install && rm /data/.npmrc && rm ~/.npmrc
