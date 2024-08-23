# fun: proxy settings for clash
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"
export no_proxy="localhost,127.0.0.1,::1"

# configure touchpad
touchpad=`xinput list | grep "Touchpad" | awk -F"id=" {'print substr($2,0,2)'}`
xinput set-prop $touchpad "libinput Tapping Enabled" 1
xinput set-prop $touchpad "libinput Natural Scrolling Enabled" 1
xinput set-prop $touchpad "libinput Accel Speed" 0.1

# app: sxhkd
# fun: handle all keys
exec sxhkd &

# app: bspwm final
# fun: windows manager, block here
exec bspwm