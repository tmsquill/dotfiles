#!/bin/bash

# Git submodule installation.
git submodule update --init --recursive

# Git installed dependencies.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Create the $XDG_CONFIG_HOME directory.
mkdir -p $HOME/.config

# Create symbolic links from the $XDG_CONFIG_HOME directory to this repository.
CONFIG_DIR=$( dirname -- "$( readlink -f -- "$0"; )"; );
ln -s $CONFIG_DIR/config/alacritty $HOME/.config/alacritty
ln -s $CONFIG_DIR/config/nvim $HOME/.config/nvim
ln -s $CONFIG_DIR/config/tmux $HOME/.config/tmux
ln -s $CONFIG_DIR/config/zsh $HOME/.config/zsh
