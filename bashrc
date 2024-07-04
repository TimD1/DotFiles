# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#CUSTOMIZATIONS START HERE

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

#customize ls colors
LS_COLORS='di=01;90:ow=01;90:fi=0:ln=31:pi=5:so=4:bd=1:cd=7:or=31;4:mi=31;4:ex=1;34'
export LS_COLORS
