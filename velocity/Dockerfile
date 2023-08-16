FROM docker.io/amazoncorretto:17-alpine

ENV JVM_ARGS=""
ENV PROGRAM_ARGS=""

RUN groupadd -r velocity && useradd -r -g velocity velocity
RUN apk update && apk add tmux

RUN mkdir -p /srv
COPY velocity.jar /srv/velocity.jar
RUN chown -R velocity:velocity /srv

WORKDIR /velocity
VOLUME [ "/velocity" ]

USER velocity

ENTRYPOINT ["/bin/sh","-c","java -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:-UseG1GC -XX:+UseZGC $JVM_ARGS -jar /srv/velocity.jar $PROGRAM_ARGS"]
