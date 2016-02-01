#!/usr/bin/env bash

cp makefile.g build/Makefile
cd build
sed -i 's/^>/\t/g' Makefile
make $@
rm Makefile

