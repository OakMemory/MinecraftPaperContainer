FROM docker.io/amazoncorretto:17-alpine

ENV JVM_ARGS=""
ENV PROGRAM_ARGS=""

RUN apk update && apk add tmux

RUN mkdir -p /srv
COPY paper.jar /srv/paper.jar

WORKDIR /minecraft

VOLUME [ "/minecraft" ]
WORKDIR /minecraft

ENTRYPOINT ["/bin/sh","-c","tmux new-session -n minecraft java -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:-UseG1GC -XX:+UseZGC ${JVM_ARGS} -jar /srv/paper.jar ${PROGRAM_ARGS}"]
