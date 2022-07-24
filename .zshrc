###############################################################################
#   ____      __
#  /_  / ___ / /
#   / /_(_-</ _ \
#  /___/___/_//_/
#
###############################################################################

export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

ZSH_THEME="agnoster"
ZSH_CUSTOM="$ZSH/custom"

plugins=(
  aliases
  ant
  brew
  docker
  docker-compose
  gh
  git
  golang
  gradle
  mvn
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

##
## Node
##

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

##
## Go
##

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

##
## Python
##

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

##
## Scripts/Binaries
##

export PATH=${PATH}:$HOME/bin

##
## Aliases
##

config-nvim() {
  PREV_PATH=$(pwd)
  cd $HOME/.config/nvim
  nvim .
  cd $PREV_PATH
}

config-kitty() {
  PREV_PATH=$(pwd)
  cd $HOME/.config/kitty
  nvim .
  cd $PREV_PATH
}

logo() {
	echo ""
	pfetch
}

##
## Starship (See https://starship.rs/ for more information)
##

eval "$(starship init zsh)"
logo

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
