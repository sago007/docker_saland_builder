FROM debian:8
MAINTAINER poul@poulsander.com
RUN apt-get update && apt-get install -y build-essential libsdl1.2-dev libxmp-dev
RUN apt-get install -y \
  git \
  zip \
  libcurl4-gnutls-dev \
  libopenal-dev \
  libopus-dev \
  libopusfile-dev \
  libsdl1.2-dev \
  libspeexdsp-dev \
  libvorbis-dev \
  gcc-mingw-w64-i686

RUN adduser --disabled-password --gecos "OpenArena user" openarena && \
  mkdir -p /data && chmod 777 /data && \
  mkdir -p /staging && chmod 777 /staging

VOLUME ["/data"]

COPY engine_compile_script.sh /opt/

USER openarena
