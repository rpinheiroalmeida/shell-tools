#!/bin/bash

set -x
trap read DEBUG
echo $((0+1))
echo $((0+2))
trap "" DEBUG
echo $((0+3))
echo $((0+4))
echo $((0+5))
