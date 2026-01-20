$env.PATH ++= ["/opt/homebrew/bin", "/Users/tmsquill/go/bin", "/usr/local/bin"]
$env.config.buffer_editor = "hx"
$env.config.show_banner = false

const NU_PLUGIN_DIRS = [
  ($nu.current-exe | path dirname)
]

alias k = kubectl

source ~/.local/share/atuin/init.nu
