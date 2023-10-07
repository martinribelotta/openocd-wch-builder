FROM alpinelinux/build-base
USER root
RUN apk add build-base
RUN apk add autoconf automake libtool pkgconf-dev
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk add libusb-dev libftdi1-dev libftdi1-static
ADD build-oocd.sh /bin/build-oocd.sh
RUN chmod +x /bin/build-oocd.sh
RUN mkdir /build
RUN mkdir /out
WORKDIR /build
