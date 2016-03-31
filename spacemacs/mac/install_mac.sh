#!/usr/bin/env bash

# check the github directory
GITHUB_DIR=$HOME/work/github
if [ -d $GITHUB_DIR ]; then
    echo "The $GITHUB_DIR has exist"
else
    echo "Create the dir $GITHUB_DIR"
    mkdir -p $GITHUB_DIR
fi

# clone the spacemacs repository
if [ -d $GITHUB_DIR/spacemacs ]; then
    echo "The $GITHUB_DIR/spacemacs has exist"
else
    cd $GITHUB_DIR && git clone https://github.com/syl20bnr/spacemacs 
    ln -s $GITHUB_DIR/spacemacs ~/.emacs.d 
fi

# config the emacs by spacemacs.mac 
SPACEMACS_CONFIG_DIR=$GITHUB_DIR/emacs/spacemacs/mac
SPACEMACS_CONFIG_FILE=$SPACEMACS_CONFIG_DIR/spacemacs.mac
if [ -f ~/.spacemacs ]; then
    unlink ~/.spacemacs 
    echo "unlink the old link file ~/.spacemacs"
fi
echo "add soft link from ${SPACEMACS_CONFIG_FILE} to ~/.spacemacs"
ln -s ${SPACEMACS_CONFIG_FILE} ~/.spacemacs
