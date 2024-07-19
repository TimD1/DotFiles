# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth
# unlimited history size
export HISTSIZE=-1
export HISTFILESIZE=-1

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# NOTE: shopt is not available in .zsh
# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command, update the values of LINES and COLUMNS
shopt -s checkwinsize


# CUSTOMIZATIONS START HERE

# set aliases
alias open='xdg-open &>/dev/null'
alias gitlog='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
alias tmux='tmux -2'

# customize command prompt
RS="\[\033[0m\]"    				# reset
HC="\[\033[1m\]"    				# hicolor
FRED="\[\033[31m\]" 				# foreground red
FWHT="\[\033[37m\]" 				# foreground white
force_color_prompt=yes				# color!
export PS1="$HC$FRED[$FWHT\w$FRED]$RS " 	# sets command prompt
export TERM=tmux-256color 			# allow color in tmux

# choose vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

# customize ls colors
LS_COLORS='di=01;90:ow=01;90:fi=0:ln=31:pi=5:so=4:bd=1:cd=7:or=31;4:mi=31;4:ex=1;34'
export LS_COLORS
