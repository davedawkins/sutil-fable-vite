FROM nginx:alpine

COPY nginx.default.conf /etc/nginx/conf.d/default.conf
RUN rm -rf /usr/share/nginx/html/*
COPY dist /usr/share/nginx/html

RUN echo $'#!/bin/sh \n\
    nginx -g "daemon off;" \n' > /usr/share/nginx/start.sh
RUN chmod +x /usr/share/nginx/start.sh
CMD ["/usr/share/nginx/start.sh"]