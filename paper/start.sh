#!/bin/bash

java -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:-UseG1GC -XX:+UseZGC "$JVM_ARGS" -jar /srv/paper.jar "$PROGRAM_ARGS"
