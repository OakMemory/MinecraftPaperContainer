FROM docker.io/amazoncorretto:17-alpine

RUN apk update && apk add screen

RUN mkdir -p /srv
COPY velocity.jar /srv/velocity.jar

WORKDIR /velocity

VOLUME [ "/velocity" ]
WORKDIR /velocity

ENTRYPOINT ["screen","-dmS","minecraft","java","-XX:+UnlockExperimentalVMOptions","-XX:+DisableExplicitGC","-XX:-UseG1GC","-XX:+UseZGC","-jar","/srv/velocity.jar"]
