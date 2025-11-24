# Personalized Dotfiles

Dotfiles for a simple and fast terminal environment.

## Installation

NOTE: Tested on macOS, but should work on Linux.

1. Initialize and pull Git submodules:

```sh
git submodule update --init --recursive
```

2. Follow the instructions to install [Homebrew](https://brew.sh/).

3. Establish symbolic links from `~/.config/<RELEVANT-DIRECTORIES>` to the `config` directory in this repository.

```sh
ln -s ~/.../dotfiles/config/alacritty ~/.config/alacritty
ln -s ~/.../dotfiles/config/helix ~/.config/helix
ln -s ~/.../dotfiles/config/nushell ~/.config/nushell
ln -s ~/.../dotfiles/config/starship/starship.toml ~/.config/starship.toml
ln -s ~/.../dotfiles/config/zellij ~/.config/zellij
```
