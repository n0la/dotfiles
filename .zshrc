bindkey -e

autoload -Uz compinit promptinit
compinit

export PS1="%n@%m$ "

export EDITOR="emacs -nw"
export BROWSER="firefox"
export MAILDIR="~/.mail/"
export MAIL="~/.mail/"

ulimit -d unlimited

# Perl local lib support.
. $HOME/.dotfiles/.locallib
