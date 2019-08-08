#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

INSTALL_PATH=`pwd`
###############
# INSTALL VIM #
###############
echo "Installing and configuring vim..."
sudo apt install -y vim curl sed

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install vim plugins
cd ~/.vim/bundle
VIM_PLUGIN_REPOS=(
	christoomey/vim-tmux-navigator	# vim-tmux nav
	tpope/vim-commentary			# easy commenting
	tpope/vim-surround				# editing shortcuts
	scrooloose/nerdtree				# tree fileviewer
	sirver/ultisnips				# expansion shortcuts
	tpope/vim-fugitive				# git integration
	itchyny/lightline.vim			# aesthetics
	tpope/vim-repeat				# plugin cmds now repeatable
	w0rp/ale						# c syntax checker
	junegunn/fzf					# fuzzy text finder
	junegunn/fzf.vim				# fzf vim integration
)
for owner_repo in "${VIM_PLUGIN_REPOS[@]}"
do
	repo="$(cut -d "/" -f 2 <<< $owner_repo)"
	[ ! -d "$repo" ] && git clone "https://github.com/$owner_repo.git"
done

# install fzf, then continue this script regardless of success
sed -i -e 's/exit/return/g' fzf/install > fzf/install
source fzf/install --no-fish --no-zsh || true

# copy ultisnips snippets
cd $INSTALL_PATH
cp -r UltiSnips ~/.vim

# set up custom vim colorscheme
if [ ! -d "~/.vim/colors" ] ; then
	mkdir ~/.vim/colors
fi
cp colorscheme.vim ~/.vim/colors/custom.vim


###############
# INSTALL GIT #
###############
echo "Installing and configuring git..."
sudo apt install -y git
git config --global user.name "Tim Dunn"
git config --global user.email "me.timd1@gmail.com"
git config --global core.editor vim
git config --global credential.helper store
git config --global alias.mt mergetool
git config --global mergetool.fugitive.cmd 'vim -f -c "Gvdiff" "$MERGED"'
git config --global merge.tool fugitive
sudo snap install hub --classic


################
# INSTALL TMUX #
################
echo "Installing and configuring tmux..."
sudo apt install -y tmux


##################
# INSTALL PYTHON #
##################
echo "Installing and configuring python..."
sudo apt install -y python python3 python-pip
sudo pip install numpy opencv-python


###################
# UPGRADE GDB/GEF #
###################
echo "Installing and configuring gdb/gef..."
wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
echo source ~/.gdbinit-gef.py >> ~/.gdbinit


###################
# SET UP SSH KEYS #
###################
# echo "Setting up ssh keys..."
# if [ ! -f ~/.ssh/id_rsa.pub ]; then
# ssh-keygen -t rsa
# fi
# ssh-copy-id -i ~/.ssh/id_rsa.pub user@host


###################
# CREATE DOTFILES #
###################
echo "Installing all dotfiles..."
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp fzf.bash ~/.fzf.bash
cp tmux.conf ~/.tmux.conf
source ~/.bashrc
echo "Success!"
