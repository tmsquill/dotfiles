# Default Editor
set -gx EDITOR nvim

# Update $PATH Variable
set PATH /opt/homebrew/bin $HOME/.istioctl/bin $PATH

# Disable Greeting Message
set fish_greeting

# Aliases
alias k="kubectl"

# Check for "eza", if present then set alias.
if type -q eza
    alias ls="eza -l"
else
    echo "eza is not installed!"
end

# Check for "starship", if present then initialize.
if type -q starship
    starship init fish | source
else
    echo "starship is not installed!"
end

# Check for "fzf_configure_bindings", if present then configure bindings.
if type -q fzf_configure_bindings
    fzf_configure_bindings --processes=\ce
else
    echo "fzf is not installed!"
end

# Check for "devbox", if present then configure bindings.
if type -q devbox
    eval "$(devbox global shellenv)"
else
    echo "devbox is not installed!"
end

