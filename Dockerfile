#Install nginx

FROM ubuntu

RUN \
   add-apt-repository -y ppa:nginx/stable && \
   apt-get update && \
   apt-get install -y nginx && \
   rm -rf /var/lib/apt/lists/* && \
   echo "/ndaemon off;" >> /rtc/nginx/nginx.conf && \
   chown -R www-data:www-data /var/lib/nginx
   
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf"]

WORKDIR /etc/nginx

CMD ["nginx"]
