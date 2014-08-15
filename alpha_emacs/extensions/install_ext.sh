#!/bin/bash

#TSOCKS="tsocks"
TSOCKS=""

### install the init-yasnippet.el ###
#${TSOCKS} wget https://raw.githubusercontent.com/redguardtoo/emacs.d/master/init-yasnippet.el -O ./extensions/init-yasnippet.el
${TSOCKS} wget https://raw.githubusercontent.com/redguardtoo/emacs.d/master/init-yasnippet.el
### install the yasnippet  ###
${TSOCKS} git clone --recursive https://github.com/capitaomorte/yasnippet

### install the init-company.el
${TSOCKS} wget https://raw.githubusercontent.com/redguardtoo/emacs.d/master/init-company.el
