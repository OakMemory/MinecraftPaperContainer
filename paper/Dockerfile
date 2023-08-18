FROM docker.io/amazoncorretto:17-alpine

ENV JVM_ARGS=""
ENV PROGRAM_ARGS=""
ENV LOCALE_TIME="Asia/Shanghai"

RUN apk update && apk add rcon bash helix

RUN mkdir -p /srv /minecraft

COPY paper.jar /srv/paper.jar
COPY start.sh /srv/start.sh

RUN chmod +x /srv/start.sh

WORKDIR /minecraft

RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo ${LOCALE_TIME} > /etc/timezone \
    && apk del tzdata

ENTRYPOINT ["/bin/sh","-c","/srv/start.sh"]
VOLUME [ "/minecraft" ]