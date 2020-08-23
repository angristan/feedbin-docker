FROM node:12

WORKDIR /app

RUN git clone https://github.com/feedbin/extract.git /app \
    && npm install \
    && mkdir users \
    && echo "secret" > users/username

CMD ["node", "app/server.js"]
