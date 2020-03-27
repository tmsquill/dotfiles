#!/bin/bash

sudo apt install -y neovim
mkdir -p $HOME/.config/nvim
touch $HOME/.config/nvim/init.vim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" >> $HOME/.config/nvim/init.vim
echo "let &packpath = &runtimepath" >> $HOME/.config/nvim/init.vim
echo "source ~/.vimrc" >> $HOME/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
