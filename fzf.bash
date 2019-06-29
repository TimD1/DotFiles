# Setup fzf
# ---------
if [[ ! "$PATH" == */home/tim/.vim/bundle/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/tim/.vim/bundle/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/tim/.vim/bundle/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/tim/.vim/bundle/fzf/shell/key-bindings.bash"
