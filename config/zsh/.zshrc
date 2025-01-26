# zmodload zsh/zprof # for profiling

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DEFAULT_USER="$(whoami)"

zstyle ':omz:update' mode reminder  # disabled, auto, reminder
zstyle ':omz:update' frequency 13   # in days

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

plugins=(
    aliases
    docker
    docker-compose
    kubectl
    minikube
    zsh-autosuggestions
    zsh-syntax-highlighting
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
## Node
##

eval "$(fnm env --use-on-cd --shell zsh)"

##
## Playdate
##

export PLAYDATE_SDK_PATH="$HOME/Developer/PlaydateSDK"
export PATH="$PATH:$PLAYDATE_SDK_PATH/bin"

##
## Python
##

export PATH="$PATH:$HOME/.local/bin"

##
## Personal
##

export DOTFILES="$HOME/dotfiles"
export PATH="$PATH:$HOME/bin"
export EDITOR=nvim

alias mvnw='$(git rev-parse --show-toplevel)/mvnw'
alias gradlew='$(git rev-parse --show-toplevel)/gradlew'
alias weather="curl -X GET 'https://wttr.in'"

config() {
    if [ -z "$1" ]; then
        PREV_PATH=$(pwd) && cd $HOME/dotfiles && nvim && cd $PREV_PATH
    else
        PREV_PATH=$(pwd) && cd $HOME/dotfiles/config/$1 && nvim && cd $PREV_PATH
    fi
}

export PATH="/usr/local/sbin:$PATH"

##
## SDKMAN
##

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# zprof # for profiling
