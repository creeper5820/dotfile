# Environment
export LANG=en_US.UTF-8

# Kitty
[ xterm-kitty = xterm-kitty ] && alias ssh="kitty +kitten ssh"

# Proxy
alias with-proxy='env {http,https,socks5}_proxy=http://127.0.0.1:7890'

# Esp32 IDF
alias idf-setup='source /opt/esp-idf/export.sh'
alias h='hyprland'
alias c='cargo'

export PATH="$PATH:$HOME/.cargo/bin"
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu

export EDITOR=nvim

# ZSH
export ZSH="$HOME/.oh-my-zsh"

plugins=( git extract z )

ZSH_THEME="fwalch"

source $ZSH/oh-my-zsh.sh

setopt nonomatch
