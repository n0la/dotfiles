# Lines configured by zsh-newuser-install
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/flo/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

prompt walters

export EDITOR="emacs"
export BROWSER="firefox"

#stty erase ^H
ulimit -d unlimited
