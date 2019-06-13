#!/bin/bash
[ ! -z "${PHP_HOST}" ]                 && sed -i "s/PHP_HOST/${PHP_HOST}/" /etc/nginx/conf.d/default.conf
[ ! -z "${PHP_PORT}" ]                 && sed -i "s/PHP_PORT/${PHP_PORT}/" /etc/nginx/conf.d/default.conf
[ ! -z "${APP_MAGE_MODE}" ]            && sed -i "s/APP_MAGE_MODE/${APP_MAGE_MODE}/" /etc/nginx/conf.d/default.conf
[ ! -z "${WWW_DIR}" ]                  && sed -i "s~WWW_DIR~${WWW_DIR}~" /etc/nginx/conf.d/default.conf
[ ! -z "${SERVICE_80_NAME}" ]          && sed -i "s~SERVICE_80_NAME~${SERVICE_80_NAME}~" /etc/nginx/conf.d/default.conf
[ ! -z "${MAX_BODY_SIZE}" ]            && sed -i "s/MAX_BODY_SIZE/${MAX_BODY_SIZE}/" /etc/nginx/nginx.conf

#Init New Relic
/usr/local/bin/setup-newrelic

/usr/sbin/nginx -g "daemon off;"
