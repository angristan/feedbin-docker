FROM ruby:2.3

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends libopencv-dev \
    && rm -rf /var/lib/apt/lists/* \
    && git clone https://github.com/feedbin/image.git /app \
    && gem install bundler \
    && bundle install

CMD ["bundle", "exec", "foreman", "start"]

