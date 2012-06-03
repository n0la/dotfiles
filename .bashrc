
export EDITOR=nano

check-dotfiles() {
  OLD=`pwd`
  cd ~/.dotfiles
  git status | grep -q "nothing to commit"
  RET=$?
  if [ $RET != 0 ]; then
    echo "You have unstaged changes in your dotfiles."
  fi
  cd $OLD
}

# Default layout for the left window. Runs cmus, mutt and irssi
left-session() {
  tmux split-window -h -t 0
  tmux split-window -v -t 0
}

# Default layout for the right window, runs emacs and other stuff
right-session() {
  tmux split-window -h -t 0
}

# Check if we modified some dotfiles we need to stage.
check-dotfiles

if [ `uname` == "FreeBSD" ]; then
  # Source FreeBSD specific bashrc file.
  source ~/.dotfiles/.bashrc_freebsd
fi
