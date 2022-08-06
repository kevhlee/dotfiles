#!/bin/bash

DOT_DIR=$(pwd)

usage() {
  echo 'Usage: ./dot.sh <install|uninstall|update>'
}

install_homebrew() {
  if [ -x "$(command -v brew)" ]; then
    echo 'Homebrew already installed'
    exit 0
  fi

  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
}

install_homebrew_deps() {
  echo "Installing dependencies via Homebrew. Grab some coffee ☕️ or tea 🍵."
  brew bundle > /dev/null
}

#######################################################################
## Main
#######################################################################

if [ "$#" -ne 1 ]; then
  usage
  exit 1
fi

COMMAND=$1

if [ $COMMAND = 'install' ]; then
  if [[ $OSTYPE == 'darwin'* ]]; then
    install_homebrew
    install_homebrew_deps
  fi

  # TODO: Install SDKMAN
  echo "Installing SDKMAN..."

  echo "Creating symbolic links..."
  ln -s $DOT_DIR/.zshrc $HOME/.zshrc
  ln -s $DOT_DIR/.gitconfig $HOME/.gitconfig
  ln -s $DOT_DIR/.ideavimrc $HOME/.ideavimrc
  ln -s $DOT_DIR/.yabairc $HOME/.yabairc
  ln -s $DOT_DIR/.skhdrc $HOME/.skhdrc
  ln -s $DOT_DIR/.config/kitty $HOME/.config/kitty
  ln -s $DOT_DIR/.config/nvim $HOME/.config/nvim
elif [ $COMMAND = 'uninstall' ]; then
  echo "Removing symbolic links..."
  unlink $HOME/.zshrc
  unlink $HOME/.gitconfig
  unlink $HOME/.ideavimrc
  unlink $HOME/.yabairc
  unlink $HOME/.skhdrc
  unlink $HOME/.config/kitty
  unlink $HOME/.config/nvim

  # TODO: Uninstall dependencies installed via Homebrew
  echo "Uninstalling dependencies..."

  # TODO: Uninstall SDKMAN
  echo "Uninstalling SDKMAN..."

  # Remove Neovim data
  rm -rf .cache/nvim
  rm -rf .local/share/nvim
elif [ $COMMAND = 'update' ]; then
  if [[ $OSTYPE == 'darwin'* ]]; then
    echo "Regenerating Brewfile..."
    rm Brewfile
    brew bundle dump > /dev/null
  fi
else
  usage
  exit 1
fi

echo "Done!"
