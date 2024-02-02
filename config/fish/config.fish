# Default Editor
set -gx EDITOR nvim

# Update $PATH Variable
set PATH /opt/homebrew/bin $HOME/.istioctl/bin $PATH

# Disable Greeting Message
set fish_greeting

# Aliases
alias k="kubectl"
alias ls="eza -l"

# Starship
starship init fish | source

# FZF Key Bindings
fzf_configure_bindings --processes=\ce
