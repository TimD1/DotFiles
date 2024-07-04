#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


###############
# INSTALL GIT #
###############
echo "Installing and configuring git..."
sudo apt install -y git
git config --global user.name "Tim Dunn"
git config --global user.email "tjdunn18@gmail.com"
git config --global core.editor vim
git config --global credential.helper store
git config --global alias.mt mergetool
git config --global mergetool.fugitive.cmd 'vim -f -c "Gvdiff" "$MERGED"'
git config --global merge.tool fugitive

INSTALL_PATH=`pwd`
###############
# INSTALL VIM #
###############
echo "Installing and configuring vim..."
sudo apt install -y vim curl sed tmux htop

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install vim plugins
cd ~/.vim/bundle
VIM_PLUGIN_REPOS=(
	christoomey/vim-tmux-navigator	# vim-tmux nav
	tpope/vim-commentary		    # easy commenting
	tpope/vim-surround		        # editing shortcuts
	scrooloose/nerdtree		        # tree fileviewer
	airblade/vim-gitgutter  		# show git changes
	tpope/vim-fugitive		        # git integration
	itchyny/lightline.vim		    # aesthetics
	tpope/vim-repeat		        # plugin cmds now repeatable
	w0rp/ale			            # c syntax checker
)
for owner_repo in "${VIM_PLUGIN_REPOS[@]}"
do
	repo="$(cut -d "/" -f 2 <<< $owner_repo)"
	[ ! -d "$repo" ] && git clone "https://github.com/$owner_repo.git"
done
cd -

# set up custom vim colorscheme
mkdir -p ~/.vim/colors
cp colorscheme.vim ~/.vim/colors/custom.vim


###################
# CREATE DOTFILES #
###################
echo "Installing all dotfiles..."
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf
source ~/.bashrc
echo "Success!"
