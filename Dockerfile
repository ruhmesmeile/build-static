FROM node:8.4.0

WORKDIR /data

ONBUILD ADD ["package.json", "npm-shrinkwrap.json", "/data/"]
ONBUILD RUN rm -rf /data/node_modules && npm install
