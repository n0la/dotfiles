
export EDITOR=nano
export PAGER=less

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

if [ `uname` == "FreeBSD" ]; then
  # Source FreeBSD specific bashrc file.
  source ~/.dotfiles/.bashrc_freebsd
fi
