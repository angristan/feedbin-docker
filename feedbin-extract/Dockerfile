FROM alpine:3.13

ARG FEEDBIN_EXTRACT_REPO
ARG EXTRACT_USER
ARG EXTRACT_SECRET

WORKDIR /app

RUN apk add --no-cache \
    git \
    nodejs \
    npm \
    && git clone ${FEEDBIN_EXTRACT_REPO:-https://github.com/feedbin/extract.git} /app \
    && npm ci \
    && mkdir users \
    && echo "${EXTRACT_SECRET}" > "users/${EXTRACT_USER}"

CMD ["node", "app/server.js"]
