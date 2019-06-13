FROM nginx:1.11
MAINTAINER Nestor Alain <naarnet10@gmail.com>

ENV PHP_HOST phpfpm
ENV PHP_PORT 9000
ENV APP_MAGE_MODE default

COPY ./conf/default.conf /etc/nginx/conf.d/
COPY ./bin/* /usr/local/bin/
COPY ./conf/nginx.conf /etc/nginx/
COPY ./bin/start.sh /usr/local/bin/start.sh


WORKDIR /srv/www

CMD ["/usr/local/bin/start.sh"]

