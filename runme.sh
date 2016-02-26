#!/bin/bash
set -x

THIS_DIR="$(pwd | sed 's/\//\\\//g')"
echo $THIS_DIR

if (! test -f .ct-ng.patched); then
    patch -p0 < ./ctng-custom-elf2flt.patch
    touch .ct-ng.patched
fi

mkdir $PWD/cmd
cd crosstool-ng
autoreconf -i -f
./configure --prefix=$PWD/../cmd && make && make install
cd ..

cat arm-frosted-eabi.config.in | sed -e "s/__CURRENT_DIR__/$THIS_DIR/g" > .config
cmd/bin/ct-ng build
