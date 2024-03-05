# Dotfiles

My preferred terminal environment, which consists of:

- [alacritty](https://github.com/alacritty/alacritty)
- [fish](https://github.com/fish-shell/fish-shell)
- [neovim](https://github.com/neovim/neovim)
- [tmux](https://github.com/tmux/tmux)

I find [NerdFonts](https://www.nerdfonts.com/font-downloads) (specifically MelsoLG) satisfying to use, the Alacritty configutation assumes it to be present.

Exact installation steps will vary depending on the operating system, but I mainly use macOS, so Homebrew dependencies are provided. Once installed, run the following:

```sh
# Clone this repository.
git clone --recurse-submodules https://github.com/tmsquill/dotfiles.github

# (macOS Only) Install useful key bindings and fuzzy completion.
$(brew --prefix)/opt/fzf/install

# Clone the Tmux Plugin Manager.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Create the $XDG_CONFIG_HOME directory.
mkdir -p $HOME/.config
  
# Create symbolic links from the $XDG_CONFIG_HOME directory to this repository.
CONFIG_DIR=$( dirname -- "$( readlink -f -- "$0"; )"; );
ln -s $CONFIG_DIR/config/alacritty $HOME/.config/alacritty
ln -s $CONFIG_DIR/config/fish $HOME/.config/fish
ln -s $CONFIG_DIR/config/nvim $HOME/.config/nvim
ln -s $CONFIG_DIR/config/tmux $HOME/.config/tmux

# Change the default shell to fish.
chsh -s `which fish`
```

## Tmux Package Manager (TPM)

Use `prefix-I` to install plugins and `prefix-U` to update them.
