FROM nginx:1.11
MAINTAINER Jose Castaneda <jose@qbo.tech>

COPY ./conf/default.conf /etc/nginx/conf.d/
COPY ./bin/* /usr/local/bin/
COPY ./conf/nginx.conf /etc/nginx/
COPY ./bin/start.sh /usr/local/bin/start.sh

RUN chmod +x /usr/local/bin/setup-newrelic

ENV SERVICE_80_NAME default
ENV PHP_HOST phpfpm-blue
ENV MAX_BODY_SIZE 10m

WORKDIR /tmp

RUN apt-get update && apt-get install -yq wget 

RUN wget http://nginx.org/keys/nginx_signing.key

RUN apt-key add nginx_signing.key && \
   echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list.d/nginx.list && \
   echo "deb-src http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list.d/nginx.list

RUN apt-get update && \
    apt-get -yq install nginx-nr-agent
# Setup environment variables for initializing New Relic
ENV NR_INSTALL_SILENT 1
ENV NR_APP_NAME "NGInX Application"

COPY ./conf/nginx-nr-agent.ini /etc/nginx-nr-agent/

WORKDIR /srv/www

CMD ["/usr/local/bin/start.sh"]

