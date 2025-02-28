# Personalized Dotfiles

A must-have collection of fantastic open-source projects, all combined to make my preferred terminal environment.

_Consists of..._

- [alacritty](https://github.com/alacritty/alacritty)
- [fzf](https://github.com/junegunn/fzf)
- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
- [nushell](https://www.nushell.sh/)
- [starship](https://github.com/starship/starship)
- [tmux](https://github.com/tmux/tmux)
    - [tpm](https://github.com/tmux-plugins/tpm)
    - [catppuccin](https://github.com/catppuccin/tmux)
    - [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)
    - [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

## Installation

Currently has only been tested on macOS and Raspberry Pi OS. Steps to install:

1. Initialize and pull Git submodules:

```sh
git submodule update --init --recursive
```

2. Download and install [devbox](https://github.com/jetify-com/devbox) by running their provided script.

`curl -fsSL https://get.jetify.com/devbox | bash`

3. Establish symbolic links from `~/.config/<RELEVANT-DIRECTORIES>` to the `config` directory in this repository.

```sh
ln -s ~/.../dotfiles/config/devbox/devbox.json ~/.config/devbox/global/default/devbox.json
ln -s ~/.../dotfiles/config/alacritty ~/.config/alacritty
ln -s ~/.../dotfiles/config/helix ~/.config/helix
ln -s ~/.../dotfiles/config/nushell ~/.config/nushell
ln -s ~/.../dotfiles/config/starship/starship.toml ~/.config/starship.toml
ln -s ~/.../dotfiles/config/zellij ~/.config/zellij
```

4. Run `devbox global install`

## Usage

**NOTE:** Only supports Debian-based operating systems at the moment, my main use case is Raspberry Pis in my homelab.

1. Ensure you have [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed.
2. Copy the `example.inventory.yml` inventory file to `inventory.yml`. Ensure it has at least one group/host configured.
3. Modify the variables at the top of the playbooks to your liking.
4. Run the playbooks in order (can be done manually or by running `ansible-playbook playbooks/main.yml`)
