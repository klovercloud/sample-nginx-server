FROM nginx:1.19.10

RUN apt-get update && apt-get -y install vim git curl bash

ENV APP_HOME /home/nginx/app

## Copy nginx configs
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/config/default.conf /etc/nginx/conf.d/default.conf

## Copy application codes & files
COPY ./app $APP_HOME

RUN mkdir -p /etc/nginx/run

RUN chown -R nginx:nginx $APP_HOME && chmod -R 755 $APP_HOME && \
        chown -R nginx:nginx /etc/nginx/conf.d && chmod -R 755 /etc/nginx/conf.d/ && \
        chown -R nginx:nginx /var/log/nginx && chmod -R 777 /var/log/nginx && \
        chown -R nginx:nginx /var/cache/nginx && chmod -R 777 /var/cache/nginx && \
        chown -R nginx:nginx /etc/nginx/run && chmod -R 777 /etc/nginx/run

EXPOSE 8080

## If you want to run nginx in foreground
## switching user to klovercloud
USER nginx
CMD ["nginx", "-g", "daemon off;"]

## If you want to run nginx in background
# COPY run.sh /run.sh
# RUN chmod +x /run.sh

## switching user to klovercloud
# USER nginx

# CMD ["bash", "/run.sh"]