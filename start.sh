#!/bin/bash

THISDIR=$(dirname "$(readlink -f $0)")
bash --rcfile "$THISDIR/.bashrc"
