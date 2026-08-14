source /usr/share/cachyos-fish-config/cachyos-config.fish

set --global fish_key_bindings fish_default_key_bindings

function fish_greeting; end

starship init fish | source

fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/go/bin"

