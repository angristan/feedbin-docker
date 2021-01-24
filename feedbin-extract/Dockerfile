FROM alpine:3.13

ARG FEEDBIN_EXTRACT_REPO

WORKDIR /app

RUN apk add --no-cache \
    git \
    nodejs \
    npm \
    && git clone ${FEEDBIN_EXTRACT_REPO:-https://github.com/feedbin/extract.git} /app \
    && npm ci \
    && mkdir users \
    && rm -rf .git

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
