FROM docker.io/amazoncorretto:17-alpine

ENV JVM_ARGS=""
ENV PROGRAM_ARGS=""

RUN addgroup -S minecraft && adduser -S -G minecraft minecraft

RUN apk update && apk add tmux rcon bash

RUN mkdir -p /srv /minecraft

COPY paper.jar /srv/paper.jar
COPY start.sh /srv/start.sh

RUN chmod +x /srv/start.sh

WORKDIR /minecraft

RUN chown -R minecraft:minecraft /srv /minecraft

USER minecraft

ENTRYPOINT ["/bin/sh","-c","/srv/start.sh"]
VOLUME [ "/minecraft" ]