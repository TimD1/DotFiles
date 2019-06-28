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
git clone https://github.com/tpope/vim-repeat		# plugin cmds now repeatable
git clone git://github.com/altercation/vim-colors-solarized.git	# colorscheme

# set up custom vim colorscheme
mkdir ~/.vim/colors
cp vim-colors-solarized/colors/solarized.vim ~/.vim/colors
cd -
cp colorscheme.vim ~/.vim/colors/custom.vim

###############
# INSTALL GIT #
###############
sudo apt install git
git config --global user.name "Tim Dunn"
git config --global user.email "me.timd1@gmail.com"
git config --global core.editor vim
git config --global credential.helper store
git config --global alias.mt mergetool
git config --global mergetool.fugitive.cmd 'vim -f -c "Gvdiff" "$MERGED"'
git config --global merge.tool fugitive

##################
# INSTALL PYTHON #
##################
# python and anaconda

###################
# CREATE DOTFILES #
###################
cp ./bashrc ~/.bashrc
cp ./vimrc ~/.vimrc
