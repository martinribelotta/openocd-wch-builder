#!/bin/sh

cd /build || exit
git clone https://github.com/jnk0le/openocd-wch.git
cd /build/openocd-wch || exit
./bootstrap
./configure --enable-static --enable-all-static --disable-shared --enable-wlink --prefix=/opt/openocd-wch --disable-gccwarnings LDFLAGS=-static
make -j8
gcc -Wall -Wstrict-prototypes -Wformat-security -Wshadow -DFD_SETSIZE=128 -g -O2 -o src/openocd src/main.o -static src/.libs/libopenocd.a -lftdi1 -lusb-1.0 -lm ./jimtcl/libjim.a
make install
cd /opt && tar czvf /out/openocd-wch-1.80.tar.gz openocd-wch
