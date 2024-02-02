#!/bin/bash

# Git submodule installation.
git submodule update --init --recursive

# Install https://github.com/ohmyzsh/ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install https://github.com/romkatv/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install the Tmux Plugin Manager.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install useful key bindings and fuzzy completion.
$(brew --prefix)/opt/fzf/install

# Create the $XDG_CONFIG_HOME directory.
mkdir -p $HOME/.config

# Create symbolic links from the $XDG_CONFIG_HOME directory to this repository.
CONFIG_DIR=$( dirname -- "$( readlink -f -- "$0"; )"; );
ln -s $CONFIG_DIR/config/alacritty $HOME/.config/alacritty
ln -s $CONFIG_DIR/config/nvim $HOME/.config/nvim
ln -s $CONFIG_DIR/config/tmux $HOME/.config/tmux
ln -s $CONFIG_DIR/config/zsh $HOME/.config/zsh
