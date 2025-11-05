if status is-interactive
    # Environment
    export LANG=en_US.UTF-8
    export EDITOR=nvim
    export PATH="$PATH:$HOME/.cargo/bin"
    export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu

    export XDG_CURRENT_DESKTOP=Hyprland
    export XDG_SESSION_DESKTOP=Hyprland

    export W820NB=0C:AE:BD:1A:B6:F9

    # Kitty
    [ xterm-kitty = xterm-kitty ] && alias ssh="kitty +kitten ssh"

    # Proxy
    alias with-proxy='env {http,https,socks5}_proxy=http://127.0.0.1:7890'

    alias h='hyprland'
    alias c='cargo'
    alias suvi='sudo -E nvim'
    alias bt='bluetoothctl'
    alias up='nmcli connect up'
    alias down='nmcli connect down'

    fish_add_path ~/.local/bin/
end
