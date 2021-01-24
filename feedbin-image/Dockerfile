FROM alpine:3.13

ARG FEEDBIN_IMAGE_REPO

WORKDIR /app

RUN apk add --no-cache \
    build-base \
    git \
    ruby-dev \
    ruby-etc \
    ruby-io-console \
    ruby-json \
    libxml2-dev \ 
    vips-dev \
    && git clone ${FEEDBIN_IMAGE_REPO:-https://github.com/feedbin/image.git} /app \
    && gem install bundler \
    && bundle install \
    && rm -rf .git

RUN sed -i 's/-c [[:digit:]]*/-c ${SIDEKIQ_CONCURRENCY:-1}/g' /app/Procfile

CMD ["bundle", "exec", "foreman", "start"]
