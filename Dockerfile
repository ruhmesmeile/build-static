FROM node:12

WORKDIR /data

ONBUILD ARG NPM_TOKEN
# test
ONBUILD ADD ["package.json", "package-lock.json", ".npmrc", "/data/"]
ONBUILD RUN rm -rf /data/node_modules && cat /data/.npmrc && npm set registry "https://verdaccio.ruhmesmeile.tools" && npm install 
