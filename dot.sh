#!/bin/bash

DOT_DIR=$(pwd)

install_homebrew() {
  if [[ $OSTYPE != 'darwin'* ]]; then
    echo "Homebrew only works on MacOS. Skipping Homebrew install..."
    return
  elif [ -x "$(command -v brew)" ]; then
    echo 'Homebrew already installed'
    return
  fi

  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null

  echo "Installing dependencies via Homebrew. Grab some coffee ☕️ or tea 🍵 (it's gonna take awhile)."
  brew bundle > /dev/null
}

uninstall_homebrew() {
  if [[ $OSTYPE != 'darwin'* ]]; then
    echo "Homebrew only works on MacOS. Skipping Homebrew uninstall..."
    return
  elif [ ! -x "$(command -v brew)" ]; then
    echo 'Homebrew not installed'
    return
  fi

  echo "Uninstalling Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
  echo "Homebrew uninstalled."
}

install_sdkman() {
  echo "Installing SDKMAN..."
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
}

uninstall_sdkman() {
  echo "Uninstalling SDKMAN..."
  rm -rf $HOME/.sdkman
}

create_symlinks() {
  echo "Creating symbolic links..."
  ln -s $DOT_DIR/.zshrc $HOME/.zshrc
  ln -s $DOT_DIR/.ideavimrc $HOME/.ideavimrc
  ln -s $DOT_DIR/config/kitty $HOME/.config/kitty
  ln -s $DOT_DIR/config/nvim $HOME/.config/nvim
}

delete_symlinks() {
  echo "Deleting symbolic links..."
  unlink $HOME/.zshrc
  unlink $HOME/.ideavimrc
  unlink $HOME/.config/kitty
  unlink $HOME/.config/nvim
}

#######################################################################
## Commands
#######################################################################

install() {
  install_homebrew
  install_sdkman
  create_symlinks
}

uninstall() {
  uninstall_homebrew
  uninstall_sdkman
  delete_symlinks

  echo "Deleting cached data..."
  rm -rf .cache/nvim
  rm -rf .local/share/nvim

}

update-brew() {
  if [[ $OSTYPE == 'darwin'* ]]; then
    echo "Regenerating Brewfile..."
    rm Brewfile
    brew bundle dump > /dev/null
  fi
}

update_symlinks() {
  delete_symlinks
  create_symlinks
}

#######################################################################
## Main
#######################################################################

usage() {
  cat <<- EOF
Usage: ./dot.sh <command>

Commands:
  install           Installs Homebrew and software as well as sets up symbolic links
  uninstall         Uninstalls Homebrew and software as well as remove symbolic links
  update-brew       Updates Homebrew dependencies in 'Brewfile' file
  update-symlinks   Updates current symbolic links
EOF
}

if [ "$#" -ne 1 ]; then
  usage
  exit 1
fi

COMMAND=$1

if [ $COMMAND = 'install' ]; then
  install
elif [ $COMMAND = 'uninstall' ]; then
  uninstall
elif [ $COMMAND = 'update-brew' ]; then
  update-brew
elif [ $COMMAND = 'update-symlinks' ]; then
  update_symlinks
else
  usage
  exit 1
fi

echo "Done!"
