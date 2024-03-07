# Dotfiles

My preferred terminal environment, which consists of:

- [alacritty](https://github.com/alacritty/alacritty)
- [fish](https://github.com/fish-shell/fish-shell)
- [neovim](https://github.com/neovim/neovim)
- [starship](https://github.com/starship/starship)
- [tmux](https://github.com/tmux/tmux)

I find [NerdFonts](https://www.nerdfonts.com/font-downloads) (specifically MelsoLG) satisfying to use, the Alacritty configutation assumes it to be present.

Exact installation steps will vary depending on the operating system, but I mainly use macOS, so Homebrew dependencies are provided. Once installed, run the following:

```sh
# (macOS Only) Install useful key bindings and fuzzy completion.
$(brew --prefix)/opt/fzf/install
```

## Tmux Package Manager (TPM)

Use `prefix-I` to install plugins and `prefix-U` to update them.
