FROM ruby:2.3

WORKDIR /app

RUN apt-get update \
    && apt-get install -y libopencv-dev \
    && git clone https://github.com/feedbin/image.git /app \
    && cd /app \
    && gem install bundler \
    && bundle install

CMD ["bundle", "exec", "foreman", "start"]

