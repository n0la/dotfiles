bindkey -e

autoload -Uz compinit promptinit
compinit

export PS1="%n@%m$ "

export EDITOR="emacs -nw"
export BROWSER="firefox"
export MAILDIR="~/.mail/"
export MAIL="~/.mail/"

ulimit -d unlimited

alias cvsup='cvs up -Pd . 2>/dev/null'

# Perl local lib support.
. $HOME/.dotfiles/.locallib

if [ -e $HOME/.cabal/bin ]; then
    PATH=$PATH:$HOME/.cabal/bin
    export PATH
fi
