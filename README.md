# Personalized Dotfiles

A must-have collection of fantastic open-source projects, all combined to make my preferred terminal environment.

_Consists of..._

- [alacritty](https://github.com/alacritty/alacritty)
- [fish](https://github.com/fish-shell/fish-shell)
    - [fisher](https://github.com/jorgebucaran/fisher)
    - [fzf.fish](https://github.com/PatrickF1/fzf.fish)
- [fzf](https://github.com/junegunn/fzf)
- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
- [neovim](https://github.com/neovim/neovim)
- [starship](https://github.com/starship/starship)
- [tmux](https://github.com/tmux/tmux)
    - [tpm](https://github.com/tmux-plugins/tpm)
    - [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)
    - [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

## Usage

**NOTE:** Only supports Debian-based operating systems at the moment, my main use case is Raspberry Pis in my homelab.

1. Ensure you have [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed.
2. Copy the `example.inventory.yml` inventory file to `inventory.yml`. Ensure it has at least one group/host configured.
3. Modify the variables at the top of the playbooks to your liking.
4. Run the playbooks in order (can be done manually or by running `ansible-playbook playbooks/site.yml`)