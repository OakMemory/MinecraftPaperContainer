FROM docker.io/bellsoft/liberica-runtime-container:jdk-17-slim-musl

RUN mkdir -p /srv /minecraft
COPY paper.jar /srv/paper.jar

ENV pwd=/minecraft
VOLUME [ "/minecraft" ]

ENTRYPOINT [ "java","-jar","/srv/paper.jar","nogui"]