FROM alpine:3.13

WORKDIR /app

RUN apk add --no-cache \
    build-base \
    git \
    ruby-dev \
    ruby-etc \
    ruby-io-console \
    ruby-json \
    libidn-dev \
    libxml2-dev \
    && git clone https://github.com/feedbin/refresher.git /app \
    && gem install bundler \
    && bundle install

CMD ["bundle", "exec", "foreman", "start"]
