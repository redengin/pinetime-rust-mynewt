#!/bin/sh

docker run --rm -it \
    --device /dev/bus/usb/ \
    --volume="$PWD":"$PWD":ro --workdir="$PWD" \
    pinetimerust \
        openocd \
            -f scripts/nrf52/swd-stlink.ocd \
            -f scripts/nrf52/flash-boot.ocd
