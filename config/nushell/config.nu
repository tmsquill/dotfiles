$env.PATH ++= ["/opt/homebrew/bin", "/Users/tmsquill/go/bin", "/usr/local/bin"]
$env.config.buffer_editor = "hx"
$env.config.show_banner = false

const NU_PLUGIN_DIRS = [
  ($nu.current-exe | path dirname)
]

# Import the Ascend Admin CLI
use "/Users/tmsquill/Documents/Projects/platform/ascend-admin-cli/api.nu"
use "/Users/tmsquill/Documents/Projects/platform/ascend-admin-cli/customer.nu"
use "/Users/tmsquill/Documents/Projects/platform/ascend-admin-cli/database.nu"
use "/Users/tmsquill/Documents/Projects/platform/ascend-admin-cli/user.nu"
use "/Users/tmsquill/Documents/Projects/platform/ascend-admin-cli/workflow.nu"

alias k = kubectl

source ~/.local/share/atuin/init.nu
