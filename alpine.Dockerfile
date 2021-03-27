FROM ruby:2.7-alpine AS builder

ARG FEEDBIN_URL
ARG FEEDBIN_REPO

WORKDIR /app

RUN apk add libldap \
    libidn-dev \
    curl-dev \
    build-base \
    bind-tools \
    postgresql-dev \
    ruby-dev \
    imagemagick-dev \
    nodejs \
    git \
    && gem install idn-ruby -v '0.1.0'

RUN git clone ${FEEDBIN_REPO:-https://github.com/feedbin/feedbin.git} /app

RUN gem install bundler -v '2.2.15' \
    && bundle add tzinfo-data \
    && bundle install \
    && bundle exec rake assets:precompile \
    && rm -rf .git

RUN sed -i 's/-c [[:digit:]]*/-c ${SIDEKIQ_CONCURRENCY:-1}/g' /app/Procfile

FROM ruby:2.7-alpine

WORKDIR /app

RUN apk add curl imagemagick libidn nodejs postgresql-client

COPY --from=builder /app /app
COPY --from=builder /usr/local/bundle /usr/local/bundle

ENV RAILS_SERVE_STATIC_FILES=true

EXPOSE 3000

