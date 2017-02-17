# Source the git prompt script
if [ -f $DOTFILES_DIR/git/git-prompt.sh ]; then
    . $DOTFILES_DIR/git/git-prompt.sh
fi

# Source the git completion script
if [ -f $DOTFILES_DIR/git/git-completion.bash ]; then
    . $DOTFILES_DIR/git/git-completion.bash
fi

# Change the looks of the prompt and include git branch
export PS1=$'\[\033[38;5;202m\]\W \xe2\x96\xb8\[\033[0m\] '
if [ -f $DOTFILES_DIR/git/git-prompt.sh ]; then
  export GIT_PS1_SHOWDIRTYSTATE=1
  export PS1=$'\[\033[38;5;202m\]\W$(__git_ps1 " (%s)") \xe2\x96\xb8\[\033[0m\] '
fi
