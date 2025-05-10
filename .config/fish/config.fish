if status is-interactive
    # Environment
    export LANG=en_US.UTF-8
    export EDITOR=nvim
    export PATH="$PATH:$HOME/.cargo/bin"
    export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu

    # Kitty
    [ xterm-kitty = xterm-kitty ] && alias ssh="kitty +kitten ssh"

    # Proxy
    alias with-proxy='env {http,https,socks5}_proxy=http://127.0.0.1:7890'

    # Esp32 IDF
    alias idf-setup='source /opt/esp-idf/export.sh'
    alias h='hyprland'
    alias c='cargo'
    alias n='nmcli'

    # Zellij
    # set ZELLIJ_AUTO_ATTACH true
    # set ZELLIJ_AUTO_EXIT true
    # eval (zellij setup --generate-auto-start fish | string collect)
end
