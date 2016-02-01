#!/usr/bin/env bash

cp makefile.g Makefile
sed -i 's/^>/\t/g' Makefile

