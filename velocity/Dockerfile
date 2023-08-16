FROM docker.io/amazoncorretto:17-alpine

ENV JVM_ARGS=""
ENV PROGRAM_ARGS=""

RUN apk update && apk add tmux

RUN mkdir -p /srv
COPY velocity.jar /srv/velocity.jar

WORKDIR /velocity

VOLUME [ "/velocity" ]
WORKDIR /velocity

ENTRYPOINT ["java","-XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:-UseG1GC -XX:+UseZGC $JVM_ARGS -jar /srv/velocity.jar $PROGRAM_ARGS"]
