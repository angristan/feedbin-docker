FROM ruby:2.3

WORKDIR /app

RUN apt-get update \
    && apt-get install -y libopencv-dev \
    && git clone https://github.com/feedbin/image.git /app \
    && cd /app \
    && gem install bundler \
    && bundle install

COPY patch.diff /app/patch.diff
RUN cd /app && git apply patch.diff

CMD ["bundle", "exec", "foreman", "start"]

