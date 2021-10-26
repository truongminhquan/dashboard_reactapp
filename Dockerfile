FROM nginx:1.20

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./build /usr/share/nginx/html