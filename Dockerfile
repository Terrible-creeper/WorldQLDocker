# syntax=docker/dockerfile:1

FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y wget iproute2

ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && \
  apt-get install -y libpqxx-dev libzmq3-dev

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

ADD ./entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]

