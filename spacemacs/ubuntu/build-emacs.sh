#!/usr/bin/env bash

# Build latest version of Emacs, version management with stow
# OS: Ubuntu 14.04 LTS and newer
# version: 25.2
# Toolkit: lucid

set -eu

readonly version="25.2"

# install dependencies
#sudo apt-get -qq update
sudo apt-get install -y stow build-essential libx11-dev xaw3dg-dev \
     libjpeg-dev libpng12-dev libgif-dev libtiff5-dev libncurses5-dev \
     libxft-dev librsvg2-dev libmagickcore-dev libmagick++-dev \
     libxml2-dev libgpm-dev libotf-dev libm17n-dev \
     libgnutls-dev wget

# download source package
mkdir -p $HOME/soft/emacs
cd $HOME/soft/emacs/
if [ ! -d emacs-"$version" ]; then
   wget http://ftp.gnu.org/gnu/emacs/emacs-"$version".tar.xz
   tar xvf emacs-"$version".tar.xz
fi

# build and install
EMACS_INSTALL_DIR=$HOME/soft/install/emacs
if [ -d $EMACS_INSTALL_DIR ]; then
    echo "The $EMACS_INSTALL_DIR has exist"
else
    mkdir -p $EMACS_INSTALL_DIR
    cd emacs-"$version"
    ./configure --prefix=$EMACS_INSTALL_DIR\
                --with-xft \
                --with-x-toolkit=lucid

    make && make install-arch-dep install-arch-indep \
                 prefix=$EMACS_INSTALL_DIR
fi
