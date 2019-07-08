#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

INSTALL_PATH=`pwd`
###############
# INSTALL VIM #
###############
sudo apt install vim

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install packages
cd ~/.vim/bundle
git clone https://github.com/christoomey/vim-tmux-navigator	# vim-tmux nav
git clone https://github.com/tpope/vim-commentary	# easy commenting
git clone https://github.com/tpope/vim-surround		# editing shortcuts
git clone https://github.com/scrooloose/nerdtree	# tree fileviewer
git clone https://github.com/sirver/ultisnips		# expansion shortcuts
git clone https://github.com/tpope/vim-fugitive		# git integration
git clone https://github.com/itchyny/lightline.vim	# aesthetics
git clone https://github.com/tpope/vim-repeat		# plugin cmds now repeatable
git clone https://github.com/w0rp/ale				# c syntax checker
git clone https://github.com/junegunn/fzf.git		# fuzzy text finder
git clone https://github.com/junegunn/fzf.vim.git	# fzf vim integration
source fzf/install --no-fish --no-zsh
cd $INSTALL_PATH
cp -r UltiSnips ~/.vim

# set up custom vim colorscheme
mkdir ~/.vim/colors
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


################
# INSTALL TMUX #
################
sudo apt install tmux


##################
# INSTALL PYTHON #
##################
sudo apt install python python3 python-pip
sudo pip install numpy opencv-python


###################
# SET UP SSH KEYS #
###################
if [ ! -f ~/.ssh/id_rsa.pub ]; then 
	ssh-keygen -t rsa
fi
# ssh-copy-id -i ~/.ssh/id_rsa.pub user@host


###################
# CREATE DOTFILES #
###################
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp fzf.bash ~/.fzf.bash
cp tmux.conf ~/.tmux.conf
source ~/.bashrc
