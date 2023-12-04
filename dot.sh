#!/bin/sh

DOTFILES=$HOME/dotfiles

usage() {
  cat <<- EOF
Usage: ./dot.sh <command>

Commands:
  setup       Sets up or updates files and symbolic links
  uninstall   Removes files and symbolic links
EOF
}

setup() {
  ln -fs $DOTFILES/config/zsh/.zshrc $HOME/.zshrc
  ln -fs $DOTFILES/config/starship/starship.toml $HOME/.config/starship.toml
  ln -fs $DOTFILES/config/vim/.vimrc $HOME/.vimrc
  ln -fs $DOTFILES/config/idea/.ideavimrc $HOME/.ideavimrc

  ln -Fhs $DOTFILES/bin $HOME/bin
  ln -Fhs $DOTFILES/config/gh-dash $HOME/.config/gh-dash
  ln -Fhs $DOTFILES/config/nvim $HOME/.config/nvim
  ln -Fhs $DOTFILES/config/kitty $HOME/.config/kitty
  ln -Fhs $DOTFILES/config/alacritty $HOME/.config/alacritty
}

uninstall() {
  unlink -f $HOME/.config/kitty
  unlink -f $HOME/.zshrc
  unlink -f $HOME/.config/starship.toml
  unlink -f $HOME/.vimrc
  unlink -f $HOME/.ideavimrc

  unlink -f $HOME/bin
  unlink -f $HOME/.config/gh-dash
  unlink -f $HOME/.config/nvim
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
elif [ $command = 'uninstall' ]; then
  uninstall
else
  usage
  exit 1
fi
