#!/usr/bin/env bash

GITHUB_DIR=$HOME/work/github
FONTS_DIR=$GITHUB_DIR/fonts

if [ -d $FONTS_DIR ]; then
    echo "the $FONTS_DIR has exist"
else
    mkdir -p $FONTS_DIR
    cd $FONTS_DIR && git clone https://github.com/powerline/fonts.git 
    cd $FONTS_DIR && ./install.sh
fi
