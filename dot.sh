#!/bin/sh

DOTFILES=$HOME/dotfiles

usage() {
  cat <<- EOF
Usage: ./dot.sh <command>

Commands:
  setup       Sets up or updates files and symbolic links
  backup      Creates a backup
  uninstall   Removes files and symbolic links
EOF
}

setup() {
  ln -fs $DOTFILES/config/zsh/.zshrc $HOME/.zshrc
  ln -fs $DOTFILES/config/starship/starship.toml $HOME/.config/starship.toml
  ln -fs $DOTFILES/config/idea/.ideavimrc $HOME/.ideavimrc

  ln -Fhs $DOTFILES/scripts/bin $HOME/bin
  ln -Fhs $DOTFILES/config/gh-dash $HOME/.config/gh-dash
  ln -Fhs $DOTFILES/config/nvim $HOME/.config/nvim
  ln -Fhs $DOTFILES/config/ghostty $HOME/.config/ghostty
}

backup() {
  cp -r . ../dotfiles-$(date +"%s")
}

uninstall() {
  unlink -f $HOME/.config/ghostty
  unlink -f $HOME/.zshrc
  unlink -f $HOME/.config/starship.toml
  unlink -f $HOME/.ideavimrc

  unlink -f $HOME/.config/gh-dash
  unlink -f $HOME/.config/nvim

  unlink -f $HOME/bin
}

#######################################################################
## Main
#######################################################################

if [ "$#" -ne 1 ]; then
  usage
  exit 1
fi

command=$1
if [ $command = 'setup' ]; then
  setup
elif [ $command = 'backup' ]; then
  backup
elif [ $command = 'uninstall' ]; then
  uninstall
else
  usage
  exit 1
fi
