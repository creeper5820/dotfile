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

    function rmcs-nvim
        cd ~/workspace/RMCS/
        docker-compose start rmcs-develop
        nohup /bin/bash -c 'docker exec -u developer -d rmcs-develop /opt/nvim-linux-x86_64/bin/nvim --headless --listen localhost:6666 && neovide --server=localhost:6666' >/dev/null 2>&1 &
    end

    function rmcs-shell
        cd ~/workspace/RMCS/
        docker-compose start rmcs-develop
        docker-compose exec -it rmcs-develop zsh
    end
end
