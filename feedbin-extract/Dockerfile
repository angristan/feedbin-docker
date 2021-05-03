FROM alpine:3.13

ARG EXTRACT_USER
ARG EXTRACT_SECRET

WORKDIR /app

RUN apk add --no-cache \
    git \
    nodejs \
    npm \
    && git clone https://github.com/feedbin/extract.git /app \
    && npm ci \
    && mkdir users \
    && echo "${EXTRACT_SECRET}" > "users/${EXTRACT_USER}"

CMD ["node", "app/server.js"]
