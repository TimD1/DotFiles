#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cp ~/.vimrc ./vimrc
cp ~/.bashrc ./bashrc
yes | cp -rf ~/.vim/UltiSnips/ ./
