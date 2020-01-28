FROM debian:stable-slim

ENV FS_VERSION null 

RUN apt-get update \
  && apt-get install -y --no-install-recommends\
  unzip\
  wget\
  curl\
  ca-certificates\
  ssh-client\
  apache2\
  libapache2-mod-php\
  php7.3\
  php7.3-bcmath\
  php7.3-curl\
  php7.3-gd\
  php7.3-mbstring\
  php7.3-xml\
  php7.3-zip\
  php7.3-mysql

# Configure Apache2
RUN a2enmod rewrite && a2enmod expires

COPY vhost.conf /etc/apache2/sites-enabled/000-default.conf

VOLUME ["/app"]

EXPOSE 80

##Copiado de entrypoint.sh##
RUN mkdir -p /usr/local/container-scripts
COPY entrypoint.sh /usr/local/container-scripts/entrypoint.sh
RUN chmod +x /usr/local/container-scripts/entrypoint.sh

ENTRYPOINT ["/usr/local/container-scripts/entrypoint.sh"]
