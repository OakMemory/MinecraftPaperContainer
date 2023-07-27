FROM docker.io/bellsoft/liberica-runtime-container:jre-17-slim-musl


RUN mkdir -p /srv
COPY paper.jar /srv/paper.jar

WORKDIR /minecraft

VOLUME [ "/minecraft" ]
WORKDIR /minecraft

ENTRYPOINT ["java","-XX:+UnlockExperimentalVMOptions","-XX:+DisableExplicitGC","-XX:-UseG1GC","-XX:+UseZGC","-jar","/srv/paper.jar","nogui"]
