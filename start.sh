#!/bin/bash

THISDIR=$(dirname "$(readlink -f $0)")
mkdir -p "$THISDIR/hut/trunk"
bash --rcfile "$THISDIR/.bashrc"
