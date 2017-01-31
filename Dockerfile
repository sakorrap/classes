# -*- aggressive-indent-mode: nil -*-

FROM ubuntu:xenial

ADD requirements.txt requirements.txt

RUN apt-get update -qq && \
    apt-get install -y \
    python \
    python-dev \
    python-pip \
    python-virtualenv \
    python-numpy \
    python-pandas \
    texlive-full \
    gosu

RUN pip install -r requirements.txt

ADD docker/entry.sh entry.sh
ADD docker/main.sh main.sh
VOLUME /data
WORKDIR /data
ENTRYPOINT ["/entry.sh"]
