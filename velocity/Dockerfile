FROM docker.io/bellsoft/liberica-runtime-container:jre-17-slim-musl


RUN mkdir -p /srv
COPY velocity.jar /srv/velocity.jar

WORKDIR /velocity

VOLUME [ "/velocity" ]
WORKDIR /velocity

ENTRYPOINT ["java","-XX:+UnlockExperimentalVMOptions","-XX:+DisableExplicitGC","-XX:-UseG1GC","-XX:+UseZGC","-jar","/srv/velocity.jar"]
