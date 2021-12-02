### Build Angular app ###
FROM node:14

ARG YANG_ID
ARG YANG_GID

ENV YANG_ID "$YANG_ID"
ENV YANG_GID "$YANG_GID"

WORKDIR /usr/src
COPY package.json ./
COPY package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build-prod

CMD cp -r /usr/src/dist/yang-catalog-admin/* /usr/share/nginx/html/admin/. && chown -R ${YANG_ID}:${YANG_GID} /usr/share/nginx/html/admin
