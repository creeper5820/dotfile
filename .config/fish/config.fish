if status is-interactive
    # Environment
    export LANG=en_US.UTF-8
    export EDITOR=nvim
    fish_add_path ~/.cargo/bin
    set -gx LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu $LD_LIBRARY_PATH

    export XDG_CURRENT_DESKTOP=Hyprland
    export XDG_SESSION_DESKTOP=Hyprland

    export W820NB=0C:AE:BD:1A:B6:F9

    export ANTHROPIC_BASE_URL="https://api.hanbbq.top"
    export ANTHROPIC_AUTH_TOKEN="sk-93ed05d0111ac3cacdc03c0808cf8e4b"
    export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1

    # Kitty
    [ xterm-kitty = xterm-kitty ] && alias ssh="kitty +kitten ssh"

    # Proxy
    alias with-proxy='env {http,https,socks5}_proxy=http://127.0.0.1:7890'

    alias h='start-hyprland'
    alias bt='bluetoothctl'

    alias rm='echo \"Do not use rm bro, is a unsafe action\" && false'
    alias ls='eza'

    fish_add_path ~/.local/bin/
end

# opencode
fish_add_path /home/creeper/.opencode/bin
