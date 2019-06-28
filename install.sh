#!/bin/bash

###############
# INSTALL VIM #
###############
sudo apt install vim

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install packages
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-commentary	# easy commenting
git clone https://github.com/tpope/vim-surround		# editing shortcuts
git clone https://github.com/scrooloose/nerdtree	# tree fileviewer
git clone https://github.com/sirver/ultisnips		# expansion shortcuts
git clone https://github.com/tpope/vim-fugitive		# git integration
git clone https://github.com/itchyny/lightline.vim	# aesthetics

# set up custom vim colorschemes


###############
# INSTALL GIT #
###############
sudo apt install git

##################
# INSTALL PYTHON #
##################
# python and anaconda

###################
# CREATE DOTFILES #
###################
cp ./.bashrc ~/.bashrc
cp ./.vimrc ~/.vimrc
