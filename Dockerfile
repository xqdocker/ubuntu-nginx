FROM ubuntu:14.04
MAINTAINER Xiaoqi Cao <thomascxq@gmail.com>

#Install Nginx

RUN apt-get update -qqy \
   && apt-get install -qqy software-properties-common \
   && apt-add-repository -y ppa:nginx/stable && apt-get update -qqy \
   && apt-get install -qqy nginx

ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

ADD data/www /data/www

RUN rm /etc/nginx/sites-enabled/default

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
