#!/usr/bin/env bash

exe=build/bin/trix.boot
objdump -b binary -m i386 -D $exe

