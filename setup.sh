#!/bin/sh
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

ln -sf $SCRIPTPATH/.vimrc ~/.vimrc
