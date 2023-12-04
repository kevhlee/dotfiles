#!/bin/sh

usage() {
  cat <<- EOF
Usage: ./brew.sh <command>

Commands:
  install           Installs Homebrew and dependencies
  uninstall         Uninstalls Homebrew and dependencies
  update            Updates dependencies in 'Brewfile' file
EOF
}

install() {
  if [ -x "$(command -v brew)" ]; then
    echo "Homebrew already installed."
    exit 1
  fi

  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null

  echo "Installing dependencies via Homebrew."
  echo "Grab some coffee ☕️ or tea 🍵 (it's gonna take awhile)."
  brew bundle > /dev/null
}

uninstall() {
  if [ ! -x "$(command -v brew)" ]; then
    echo "Homebrew not installed."
    exit 1
  fi

  echo "Uninstalling Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
  echo "Homebrew uninstalled."
}

update() {
  echo "Regenerating Brewfile..."
  rm Brewfile
  brew bundle dump > /dev/null
}

#######################################################################
## Main
#######################################################################

if [[ $OSTYPE != 'darwin'* ]]; then
  echo "Homebrew only works on MacOS."
  exit 1
fi

if [ "$#" -ne 1 ]; then
  usage
  exit 1
fi

command=$1
if [ $command = 'install' ]; then
  install
elif [ $command = 'uninstall' ]; then
  uninstall
elif [ $command = 'update' ]; then
  update
else
  usage
  exit 1
fi
