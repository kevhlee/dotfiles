#!/bin/sh

DOTDIR=$HOME/dotfiles

ln -s $DOTDIR/.zshrc $HOME/.zshrc
ln -s $DOTDIR/.vimrc $HOME/.vimrc
ln -s $DOTDIR/.ideavimrc $HOME/.ideavimrc
ln -s $DOTDIR/.config/kitty $HOME/.config/kitty
ln -s $DOTDIR/.config/nvim $HOME/.config/nvim
ln -s $DOTDIR/.config/starship.toml $HOME/.config/starship.toml
