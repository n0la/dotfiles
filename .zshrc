bindkey -e emacs

autoload -Uz compinit promptinit
compinit

export PS1="%n@%m$ "

export EDITOR="emacs -nw"
export BROWSER="firefox"
export MAILDIR="~/.mail/"
export MAIL="~/.mail/"

export LANG="en_GB.UTF-8"

ulimit -d unlimited

alias cvsup='cvs up -Pd . 2>/dev/null'

if [ -e $HOME/.cabal/bin ]; then
    PATH=$PATH:$HOME/.cabal/bin
    export PATH
fi
