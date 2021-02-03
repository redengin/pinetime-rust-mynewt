#!/bin/sh

docker run --rm --user "$(id -u)":"$(id -g)" \
    --volume="$PWD":"$PWD" --workdir="$PWD" \
    pinetimerust \
       newt install
