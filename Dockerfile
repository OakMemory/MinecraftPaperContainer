ARG PAPER_FILE

FROM docker.io/bellsoft/liberica-runtime-container:jdk-17-slim-musl

RUN mkdir -p /srv || mkdir /minecraft
ENV pwd=/minecraft

COPY $PAPER_FILE /srv/paper.jar

ENTRYPOINT [ "java" "-jar" "/srv/paper.jar" "nogui"]