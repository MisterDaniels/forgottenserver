FROM ubuntu:latest AS builder

ENV TZ=America/Sao_Paulo
ARG DOCKER_WORK_DIR

COPY . $DOCKER_WORK_DIR

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt install -y git cmake build-essential \
    libluajit-5.1-dev libmysqlclient-dev libboost-system-dev \
    libboost-iostreams-dev libboost-filesystem-dev libpugixml-dev \
    libcrypto++-dev libboost-date-time-dev
RUN cd $DOCKER_WORK_DIR/build && cmake .. && make && mv tfs ..