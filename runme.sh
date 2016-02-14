#!/bin/bash
set -x

THIS_DIR="$(pwd | sed 's/\//\\\//g')"
echo $THIS_DIR

if (! test -f .ct-ng.patched); then
    patch -p0 < ./ctng-custom-elf2flt.patch
    touch .ct-ng.patched
fi

cat arm-frosted-eabi.config.in | sed -e "s/__CURRENT_DIR__/$THIS_DIR/g" > .config

ct-ng build
