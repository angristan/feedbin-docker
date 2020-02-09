FROM ruby:2.5

WORKDIR /app

RUN apt-get update \
    && apt-get install -y libidn11-dev \
    && git clone https://github.com/feedbin/refresher.git /app \
    && cd /app \
    gem install bundler \
    && bundle install

CMD ["bundle", "exec", "foreman", "start"]

