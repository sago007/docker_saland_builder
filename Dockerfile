FROM sago007/docker_blockattack

RUN make cmake sdl2_gfx libxml2

RUN adduser --disabled-password --gecos "Builder user" builder && \
  mkdir -p /data && chmod 777 /data && \
  mkdir -p /staging && chmod 777 /staging

VOLUME ["/data"]

COPY saland_compile_script.sh /opt/


CMD /opt/saland_compile_script.sh