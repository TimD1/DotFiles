#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

email="tjdunn18@gmail.com"

#################
# CONFIGURE GIT #
#################
echo "git version: $(git --version)"
git config --global user.name "Tim Dunn"
git config --global user.email "$email"
git config --global core.editor vim
# use fugitive for resolving merge conflicts
git config --global alias.mt mergetool
git config --global mergetool.fugitive.cmd 'vim -f -c "Gvdiff" "$MERGED"'
git config --global merge.tool fugitive
# use ssh keys to sign git commits
ssh-keygen -t ed25519 -C "$email" -N "" -f "id" >> /dev/null
mv id > ~/.ssh; mv id.pub ~/.ssh
git config --global gpg.format ssh
git config --global commit.gpgsign true
git config --global user.signingkey ~/.ssh/id.pub
echo "git ssh/signing key (upload this): $(cat ~/.ssh/id.pub)"

#################
# CONFIGURE VIM #
#################
echo "vim version: $(vim --version | head -n 1)"
# install pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# install vim plugins
mkdir -p ~/.vim/autoload ~/.vim/bundle
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
	w0rp/ale			            # syntax checker
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
echo "installing dotfiles..."
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf
source ~/.bashrc
echo "source ~/.bashrc" >> ~/.bash_profile
