#!/bin/bash

# Not exist.
if [ ! -f "/path/to/file" ]; then
    random_pwd=$(head -c 16 /dev/urandom | tr -dc 'A-Za-z0-9' | head -c 16)
    mv /server.properties /minecraft/server.properties
    sed -i "s/rcon\.port=.*/$RCON_PORT/g" /minecraft/server.properties
    sed -i "s/rcon\.port=.*/$random_pwd/g" /minecraft/server.properties

    echo \
        "[minecraft]
hostname = 127.0.0.1
port = $RCON_PORT
password = $random_pwd
minecraft = true" >>/rcon.cfg

fi

java -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:-UseG1GC -XX:+UseZGC "$JVM_ARGS" -jar /srv/paper.jar "$PROGRAM_ARGS"
