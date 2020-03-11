FROM sago007/docker_blockattack

RUN apt-get update && apt-get install -y zip gettext mxe-i686-w64-mingw32.static-sdl2-gfx mxe-i686-w64-mingw32.static-libxml2 mxe-i686-w64-mingw32.static-box2d libutfcpp-dev

RUN adduser --disabled-password --gecos "Builder user" builder && \
  mkdir -p /data && chmod 777 /data && \
  mkdir -p /staging && chmod 777 /staging

VOLUME ["/data"]

COPY saland_compile_script.sh /opt/

USER builder
