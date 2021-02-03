Pinetime
================================================================================

Creating the Docker Image
--------------------------------------------------------------------------------
```sh
# create the docker image
docker build -t pinetimerust docker/pinetimerust/
```

Pinetime Building and Flashing
--------------------------------------------------------------------------------
```sh
# install newt mcuboot (only need to do this once)
./docker/newt-install.sh

# build boot
./docker/build-boot.sh
# build app
./docker/build-app.sh

# flash boot
./docker/flash-boot.sh
# flash app
./docker/flash-app.sh
```

