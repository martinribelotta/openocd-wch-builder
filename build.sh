#!/bin/sh
F=$(realpath "$0")
B=$(dirname "$F")
OUT=$B/out
mkdir -p "$OUT"
docker run --volume="$OUT":/out --entrypoint=/bin/build-oocd.sh alpine-openocd-build
