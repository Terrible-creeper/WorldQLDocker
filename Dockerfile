# syntax=docker/dockerfile:1

FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y wget 

ENV DEBIAN_FRONTEND=noninteractive 
RUN apt-get update && \
  apt-get install -y libpqxx-dev libzmq3-dev

ENV WQL_LEAF_SQUARE_SIZE=16
ENV WQL_TREE_DEGREE=512
ENV WQL_NUM_LEVELS=2
ENV WQL_ROOTS_PER_TABLE=8

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

ADD ./wrapper.sh /wrapper.sh
CMD [ "/bin/bash", "/wrapper.sh" ]

