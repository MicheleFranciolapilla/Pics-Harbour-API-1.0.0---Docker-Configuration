#!/bin/bash

SEED_DB="true"
MODE=""

while (( "$#" )); do
    case "${1,,}" in
        noseed)
            SEED_DB="false"
            shift
            ;;
        -d)
            MODE="-d"
            shift
            ;;
        *)
            echo "Unknown option: $1"
            shift
            ;;
    esac
done

SEED_DB=$SEED_DB docker-compose up $MODE
