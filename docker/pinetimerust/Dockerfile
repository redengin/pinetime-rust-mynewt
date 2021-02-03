FROM rust:slim

# update the package list
RUN apt update

# TOOLCHAIN
ARG TOOLCHAIN_TARBALL=https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2?revision=05382cca-1721-44e1-ae19-1e7c3dc96118&la=en&hash=D7C9D18FCA2DD9F894FD9F3C3DC9228498FA281A
ADD $TOOLCHAIN_TARBALL /tmp/toolchain.tbz
RUN \
    apt install -y \
        bzip2 \
 && tar xf /tmp/toolchain.tbz -C /opt/ \
 && rm /tmp/toolchain.tbz
ENV PATH="${PATH}:/opt/gcc-arm-none-eabi-9-2020-q2-update/bin/"
RUN \
    rustup update \
 && rustup default nightly \
 && rustup target add thumbv7em-none-eabihf

# NEWT
ARG GO_VERSION=1.15.7
ADD https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz /tmp/go.tgz
RUN \
    tar xf /tmp/go.tgz -C /opt/ \
 && rm /tmp/go.tgz
ENV GOPATH="/opt/go/"
ENV PATH="${PATH}:${GOPATH}/bin"
RUN \
    apt install -y \
        git \
 && cd /tmp && git clone https://github.com/lupyuen/mynewt-newt.git \
 && cd /tmp/mynewt-newt && ./build.sh \
 && cp newt/newt /opt/newt \
 && cd /tmp/ && rm -rf mynewt-newt/
ENV PATH="${PATH}:/opt/"

# OPENOCD
ARG OPENOCD_TARBALL=https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.10.0-15/xpack-openocd-0.10.0-15-linux-x64.tar.gz
ADD ${OPENOCD_TARBALL} /tmp/openocd.tgz
RUN \
    tar xf /tmp/openocd.tgz -C /opt/ \
 && rm -rf /tmp/openocd.tgz
ENV PATH="${PATH}:/opt/xpack-openocd-0.10.0-15/bin/"


