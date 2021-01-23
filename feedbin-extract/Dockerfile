FROM node:12

WORKDIR /app

RUN git clone https://github.com/feedbin/extract.git /app \
    && npm install \
    && mkdir users 

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
