#!/bin/sh

docker run --rm --user "$(id -u)":"$(id -g)" \
    --volume="$PWD":"$PWD" --workdir="$PWD" \
    pinetimerust \
       scripts/nrf52/build-boot.sh
