FROM ubuntu:18.04
LABEL maintainer="roian <roian@gmail.com>"
# install webserver apache
RUN apt-get update && \
    apt-get install -y apache2
RUN echo "TEST WEB" > /var/www/html/index.html

###############################
RUN  echo "ServerName localhost" >> /etc/apache2/apache2.conf
###############################
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUD"]
