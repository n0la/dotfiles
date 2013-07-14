
export EDITOR=nano
export PAGER=less

export LANG="en_US.UTF-8"
export LC_CTYPE=$LANG
export LC=$LANG
export LOCALE=$LANG

export MAILDIR="~/.mail/"
export MAIL="~/.mail/"

check-dotfiles() {
  OLD=`pwd`
  cd ~/.dotfiles
  git status | grep -q "nothing to commit"
  RET=$?
  if [ $RET != 0 ]; then
    echo "You have unstaged changes in your dotfiles."
  fi
  cd "$OLD"
}

personal-bin() {
  # Export personal binary directory if
  # it exists.
  if [ -d ~/bin ]; then
    export PATH=$PATH:~/bin
  fi        
}

run-btpd() {
    PIDS=`pgrep btpd`
    RET=$?
    if [ $RET == 1 ]; then
      btpd --bw-out 40 -p 46000 --logfile ~/.btpd/btpd.log
    else
      echo "btpd is already running, pids: " $PIDS
    fi
}

# Check if we modified some dotfiles we need to stage.
check-dotfiles
personal-bin

if [ -e /etc/profile.d/bash-completion.sh ]; then
  source /etc/profile.d/bash-completion.sh
fi

if [ -e /usr/local/share/bash-completion/bash_completion ]; then
  source /usr/local/share/bash-completion/bash_completion
fi

if [ `uname` == "FreeBSD" ]; then
  # Source FreeBSD specific bashrc file.
  source ~/.dotfiles/.bashrc_freebsd
elif [ `uname` == "OpenBSD" ]; then
  export PS1="\u@\h:\w$ "
fi

EMACS=`which emacs`
RET=$?
if [ $RET == 0 ]; then
  export EDITOR="$EMACS -nw"
fi

alias xterm='xterm -u8'
