#!/usr/bin/env bash

exe=build/bin/trix.bootloader
objdump -b binary -m i386 -D $exe

