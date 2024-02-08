#!/bin/bash

CLEAN=""

for arg in "$@"
do
    if [ "$arg" == "--clean" ] || [ "$arg" == "-c" ]
    then
        CLEAN="--volumes"
        break
    fi
done

docker compose -p i-dair-codex down $CLEAN