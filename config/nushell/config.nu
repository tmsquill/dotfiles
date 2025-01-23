# config.nu
#
# Installed by:
# version = "0.101.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

$env.PATH ++= ["/Users/tmsquill/.local/share/devbox/global/default/.devbox/nix/profile/default/bin", "/Users/tmsquill/go/bin", "/usr/local/bin"]

$env.config.buffer_editor = "hx"

alias k = kubectl

$env.config.show_banner = false

# TODO: devbox, fzf
