#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <container_name|id> | all"
    exit 1
fi

if [ "$1" = "all" ]; then
    containers=$(docker ps -a -q)
    if [ -n "$containers" ]; then
        docker stop $containers
    else
        echo "No containers to stop."
    fi
else
    docker stop "$1"
fi
