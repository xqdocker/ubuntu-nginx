FROM ubuntu:14.04
MAINTAINER Xiaoqi Cao <thomascxq@gmail.com>

#Install Nginx

RUN apt-get update

RUN apt-get -y install software-properties-common
RUN apt-add-repository -y ppa:nginx/stable
RUN apt-get update

RUN apt-get -y install nginx