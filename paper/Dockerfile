FROM docker.io/amazoncorretto:17-alpine

RUN apk update && apk add screen

RUN mkdir -p /srv
COPY paper.jar /srv/paper.jar

WORKDIR /minecraft

VOLUME [ "/minecraft" ]
WORKDIR /minecraft

ENTRYPOINT ["screen","-dmS","minecraft","java","-XX:+UnlockExperimentalVMOptions","-XX:+DisableExplicitGC","-XX:-UseG1GC","-XX:+UseZGC","-jar","/srv/paper.jar","nogui"]
