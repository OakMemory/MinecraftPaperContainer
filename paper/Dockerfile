FROM docker.io/amazoncorretto:17-alpine

ENV JVM_ARGS=""
ENV PROGRAM_ARGS=""
ENV RCON_PORT=25567

RUN apk update && apk add tmux rcon bash

RUN mkdir -p /srv
COPY paper.jar /srv/paper.jar
COPY start.sh /start.sh

RUN chmod 777 /start.sh \
    && chmod 777 /bin/rcon.sh

WORKDIR /minecraft

VOLUME [ "/minecraft" ]
WORKDIR /minecraft

ENTRYPOINT ["/bin/sh","-c","/start.sh"]
