#!/bin/bash

rcon_command="rcon -c /rcon.cfg -s minecraft"

args=("$@")

$rcon_command "${args[@]}"