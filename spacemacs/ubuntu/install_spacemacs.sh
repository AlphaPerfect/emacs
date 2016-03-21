#!/bin/bash

GITHUB_DIR=$HOME/work/github
SPACEMACS_CONFIG_DIR=$GITHUB_DIR/emacs/spacemacs/ubuntu

if [ -f $GITHUB_DIR/spacemacs ]; then
    echo "the $SPACEMACS_DIR has exist"
else
    mkdir -p $GITHUB_DIR
    cd $GITHUB_DIR && git clone https://github.com/syl20bnr/spacemacs 
    ln -s $GITHUB_DIR/spacemacs ~/.emacs.d 
fi

if [ -f ~/.spacemacs ]; then
    unlink ~/.spacemacs 
    echo "unlink the old link file ~/.spacemacs"
    ln -s ${SPACEMACS_CONFIG_DIR}/spacemacs.ubuntu ~/.spacemacs
else
    echo "add soft link from ${PWD}/spacemacs to ~/.spacemacs"
    ln -s ${SPACEMACS_CONFIG_DIR=}/spacemacs.ubuntu ~/.spacemacs
fi
