FROM docker.io/amazoncorretto:17-alpine

ENV JVM_ARGS=""
ENV PROGRAM_ARGS=""
ENV LOCALE_TIME="Asia/Shanghai"

RUN apk update && apk add helix

RUN mkdir -p /srv
COPY velocity.jar /srv/velocity.jar

WORKDIR /velocity
VOLUME [ "/velocity" ]

RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo ${LOCALE_TIME} > /etc/timezone \
    && apk del tzdata

ENTRYPOINT ["/bin/sh","-c","java -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:-UseG1GC -XX:+UseZGC $JVM_ARGS -jar /srv/velocity.jar $PROGRAM_ARGS"]
