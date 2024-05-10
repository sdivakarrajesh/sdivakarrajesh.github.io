FROM nginx:1.17.9-alpine

RUN rm -rf /usr/share/nginx/html/*

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./index.html license.txt test.html /usr/share/nginx/html/
ADD pages /usr/share/nginx/html/pages
ADD assets /usr/share/nginx/html/assets
ENTRYPOINT ["nginx", "-g", "daemon off;"]


