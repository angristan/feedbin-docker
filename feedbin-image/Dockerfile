FROM alpine:3.13

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
    && git clone https://github.com/feedbin/image.git /app \
    && gem install bundler \
    && bundle install

CMD ["bundle", "exec", "foreman", "start"]
