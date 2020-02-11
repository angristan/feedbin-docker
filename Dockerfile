FROM ruby:2.6

WORKDIR /app

RUN apt-get update \
    && apt-get install -y \
        libldap-2.4-2 \
        libidn11-dev \
        dnsutils \
        postgresql-client \
    && gem install idn-ruby -v '0.1.0'

RUN git clone https://github.com/feedbin/feedbin.git /app

RUN cd /app \
    && gem install bundler -v '2.1.2' \
    && bundle install \
    && bundle exec rake assets:precompile

ENV RAILS_SERVE_STATIC_FILES=true

EXPOSE 3000

