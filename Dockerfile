FROM ubuntu:16.04

MAINTAINER Matteo Bachetti <matteo@matteobachetti.it>

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN echo 'deb http://us.archive.ubuntu.com/ubuntu trusty main multiverse' >> /etc/apt/sources.list && \
    mkdir /var/run/sshd && \
    apt-get -y check && \
    apt-get -y update && \
    apt-get install -y apt-utils apt-transport-https software-properties-common python-software-properties && \
    apt-get -y update --fix-missing && \
    apt-get -y update && apt-get install -y pgplot5 && \
    mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    cat /etc/apt/sources.list.bak | grep -v multiverse > /etc/apt/sources.list && \
    apt-get -y update && apt-get -y update


RUN apt-get install -qq ftp \
                        wget \
                        csh \
                        build-essential \
                        gfortran \
                        groff-base \
                        python3 \
                        libcfitsio-bin libcfitsio-dev \
                        libgtk2.0-dev \
                        libgtk2.0  && apt-get clean

RUN useradd -m pulsar && echo "pulsar:pulsar" | chpasswd && adduser pulsar sudo

USER pulsar

COPY .bashrc /home/pulsar/.bashrc

RUN cd /home/pulsar && pwd && id && . /home/pulsar/.bashrc && mkdir pulsar_software && cd pulsar_software

WORKDIR /home/pulsar/pulsar_software

RUN wget -q http://www.iram.fr/~gildas/dist/gildas-src-may17c.tar.gz

RUN tar zxvf gildas-src-may17c.tar.gz

RUN rm *.tar.gz

WORKDIR /home/pulsar/pulsar_software/gildas-src-may17c

RUN ls

RUN . admin/gildas-env.sh && \
    make && make install

