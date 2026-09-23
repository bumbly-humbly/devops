FROM nginx:stable-alpine3.24-slim

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./second.html /usr/share/nginx/html/second.html
COPY ./app.js /usr/share/nginx/html/app.js
COPY ./style.css /usr/share/nginx/html/style.css

EXPOSE 80
