FROM alpine:3.13

ARG FEEDBIN_URL
ARG FEEDBIN_REPO

WORKDIR /app

RUN apk add --no-cache \
    linux-headers \
    tzdata \
    git \
    ruby-dev \
    ruby-etc \
    ruby-bigdecimal \
    ruby-io-console \
    build-base \
    imagemagick-dev \
    imagemagick-libs \
    libxml2-dev \
    libxslt-dev \
    nodejs \
    libldap \
    libidn-dev \
    bind-tools \
    postgresql-client \
    libpq \
    postgresql-dev \
    && gem install 'etc:1.2.0' 'idn-ruby:0.1.0' \
    && git clone ${FEEDBIN_REPO:-https://github.com/feedbin/feedbin.git} /app \
    && gem install bundler \
    && bundle install \
    && bundle exec rake assets:precompile

RUN sed -i 's/-c [[:digit:]]*/-c ${SIDEKIQ_CONCURRENCY:-1}/g' /app/Procfile

ENV RAILS_SERVE_STATIC_FILES=true

EXPOSE 3000
