FROM ubuntu:19.04
MAINTAINER Imagawa Yakata <twitter@imagawa_yakata>

RUN apt-get update \
    && apt-get install -y locales \
    && locale-gen ja_JP.UTF-8 \
    && echo "export LANG=ja_JP.UTF-8" >> /etc/profile

RUN apt-get install -y vim git tree

RUN useradd -m --no-log-init -r -U echizen
USER echizen
ENV PATH /home/echizen/.local/bin:$PATH

COPY --chown=echizen:echizen . /code
WORKDIR /code

