#!/bin/bash
set -x

THIS_DIR="$(pwd | sed 's/\//\\\//g')"
echo $THIS_DIR

cat arm-frosted-eabi.config.in | sed -e "s/__CURRENT_DIR__/$THIS_DIR/g" > .config

ct-ng build
