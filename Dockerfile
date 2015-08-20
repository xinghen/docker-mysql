#
# MAINTAINER        yichao.chen <cycxhen@hotmail.com>
# DOCKER-VERSION    1.7.1
#
# Dockerizing MySQL: Dockerfile for building MySQL5.6 images
#
FROM xinghen/centos:6
MAINTAINER yichao.chen  <cycxhen@hotmail.com>

# Install MySQL
RUN yum install -y  libxml2-devel ncurses-devel bison libmcrypt libmcrypt-devel  libtool-ltdl-devel && \
    yum clean all

RUN rpm -ivh http://58.68.xx.xx/scripts/mysql-5.6.26-1.el6.x86_64.rpm --nodeps

EXPOSE 3306

ADD     supervisor_mysql.conf /etc/supervisor.conf.d/mysql.conf
