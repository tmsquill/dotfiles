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

const NU_PLUGIN_DIRS = [
  ($nu.current-exe | path dirname)
]

$env.EDITOR = "hx"
$env.config.buffer_editor = "hx"
$env.config.show_banner = false
$env.PATH ++= ["/Users/tmsquill/.config/devbox/global/default/.devbox/nix/profile/default/bin", "/Users/tmsquill/go/bin", "/usr/local/bin"]

# Import the Ascend Admin CLI
use "/Users/tmsquill/Documents/Projects/platform/ascend-admin-cli/api.nu"
use "/Users/tmsquill/Documents/Projects/platform/ascend-admin-cli/customer.nu"
use "/Users/tmsquill/Documents/Projects/platform/ascend-admin-cli/database.nu"
use "/Users/tmsquill/Documents/Projects/platform/ascend-admin-cli/user.nu"
use "/Users/tmsquill/Documents/Projects/platform/ascend-admin-cli/workflow.nu"

alias k = kubectl

source ~/.local/share/atuin/init.nu
