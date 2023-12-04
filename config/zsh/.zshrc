# zmodload zsh/zprof # for profiling

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DEFAULT_USER="$(whoami)"

ZSH_THEME="agnoster"

zstyle ':omz:update' mode reminder  # disabled, auto, reminder
zstyle ':omz:update' frequency 13   # in days

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(
  aliases
  docker
  docker-compose
  golang
  kubectl
  minikube
  rust
  web-search
  zsh-autosuggestions
  zsh-syntax-highlighting
)

ZSH_WEB_SEARCH_ENGINES=(
  reddit "https://www.reddit.com/search/?q="
  twitch "https://www.twitch.tv/search?term="
  youtube "https://www.youtube.com/results?search_query="
  sourcegraph "https://sourcegraph.com/search?q="
)

source $ZSH/oh-my-zsh.sh

##
## Starship
##

eval "$(starship init zsh)"

##
## Docker
##

export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"

##
## Go
##

export PATH=$PATH:$(go env GOPATH)/bin

##
## Python
##

export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"

##
## Node
##

eval "$(fnm env --use-on-cd)"

##
## OCaml
##

# opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

##
## Standard ML
##

export PATH="$PATH:/usr/local/smlnj/bin"

##
## Liferay
##

export PATH="$PATH:$HOME/Library/PackageManager/bin"

##
## C
##

export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/local/lib

# export LDFLAGS="-L/usr/local/opt/llvm@12/lib"
# export CPPFLAGS="-I/usr/local/opt/llvm@12/include"
# export PATH="/usr/local/opt/llvm@12/bin:$PATH"

##
## Personal
##

export DOTFILES="$HOME/dotfiles"
export PATH="$PATH:$HOME/bin"
export EDITOR=nvim

alias gw='$(git rev-parse --show-toplevel)/gradlew'
alias gradlew='$(git rev-parse --show-toplevel)/gradlew'
alias weather="curl -X GET 'https://wttr.in'"

bongo() {
  neofetch --ascii $DOTFILES/config/neofetch/bongo
}

config() {
  PREV_PATH=$(pwd) && cd $HOME/dotfiles && nvim && cd $PREV_PATH
}

config-kitty() {
  PREV_PATH=$(pwd) && cd $HOME/dotfiles/config/kitty && nvim && cd $PREV_PATH
}

config-vim() {
  PREV_PATH=$(pwd) && cd $HOME/dotfiles/config/vim && vim && cd $PREV_PATH
}

config-nvim() {
  PREV_PATH=$(pwd) && cd $HOME/dotfiles/config/nvim && nvim && cd $PREV_PATH
}

export PATH="/usr/local/sbin:$PATH"

##
## SDKMAN
##

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

bongo
# zprof # for profiling
