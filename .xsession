# fun: proxy settings for clash
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"
export no_proxy="localhost,127.0.0.1,::1"

# app: sxhkd
# fun: handle all keys
exec sxhkd &

# app: bspwm final
# fun: windows manager, block here
exec bspwm