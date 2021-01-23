#!/bin/bash

echo ${EXTRACT_SECRET} > users/${EXTRACT_USER}
node app/server.js
