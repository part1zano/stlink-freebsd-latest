#!/usr/bin/env bash

python getlatest.py
rm -f distinfo
make makesum
