FROM node:12

ARG EXTRACT_USER
ARG EXTRACT_SECRET

WORKDIR /app

RUN git clone https://github.com/feedbin/extract.git /app \
    && npm install \
    && mkdir users \
    && echo ${EXTRACT_SECRET} > users/${EXTRACT_USER}

CMD ["node", "app/server.js"]
