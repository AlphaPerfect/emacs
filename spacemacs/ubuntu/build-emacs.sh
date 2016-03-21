#!/bin/bash

# Build latest version of Emacs, version management with stow
# OS: Ubuntu 14.04 LTS and newer
# version: 24.5
# Toolkit: lucid

set -eu

readonly version="24.5"

# install dependencies
sudo apt-get -qq update
sudo apt-get -qq install -y stow build-essential libx11-dev xaw3dg-dev \
     libjpeg-dev libpng12-dev libgif-dev libtiff5-dev libncurses5-dev \
     libxft-dev librsvg2-dev libmagickcore-dev libmagick++-dev \
     libxml2-dev libgpm-dev libotf-dev libm17n-dev \
     libgnutls-dev wget

# download source package
mkdir -p $HOME/soft/emacs
cd $HOME/soft/emacs/
if [[ ! -d emacs-"$version" ]]; then
   wget http://ftp.gnu.org/gnu/emacs/emacs-"$version".tar.xz
   tar xvf emacs-"$version".tar.xz
fi

# build and install
mkdir -p $HOME/soft/install/emacs
cd emacs-"$version"
./configure \
    --prefix=$HOME/soft/install/emacs
    --with-xft \
    --with-x-toolkit=lucid

make
sudo make \
    install-arch-dep \
    install-arch-indep \
    prefix=$HOME/soft/install/emacs-"$version"
