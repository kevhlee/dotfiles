#!/bin/bash

DOT_DIR=$(pwd)

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

update_symlinks() {
  delete_symlinks
  create_symlinks
}

install() {
  create_symlinks
}

uninstall() {
  delete_symlinks

  echo "Deleting cached data..."
  rm -rf .cache/nvim
  rm -rf .local/share/nvim

}

#######################################################################
## Main
#######################################################################

usage() {
  cat <<- EOF
Usage: ./dot.sh <command>

Commands:
  install           Installs configurations and sets up symbolic links
  uninstall         Uninstalls configurations and removes symbolic links
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
elif [ $COMMAND = 'update-symlinks' ]; then
  update_symlinks
else
  usage
  exit 1
fi

echo "Done!"
