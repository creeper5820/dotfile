# Environment
export LANG=en_US.UTF-8

# Kitty
[ xterm-kitty = xterm-kitty ] && alias ssh="kitty +kitten ssh"

# Oroxy
alias with-proxy='env {http,https,socks5}_proxy=http://127.0.0.1:7890'

# Esp32 IDF
alias idf-setup='source /opt/esp-idf/export.sh'
alias h='hyprland'
alias c='cargo'

# Rust Environment
export PATH="$PATH:$HOME/.cargo/bin"

# ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="fwalch"

source $ZSH/oh-my-zsh.sh

plugins=(git extract)
setopt nonomatch

