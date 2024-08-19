
## basic
``` bash
# basic develop packages
sudo apt-get install -y \
    build-essential \
    lsb-release gnupg software-properties-common \
    wget curl unzip git zsh \
    gcc g++ gdb make cmake \
    gcc-arm-none-eabi

# get the latest clangd and clang-format from llvm
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/llvm-apt.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/llvm-apt/`lsb_release -cs`/ llvm-toolchain-`lsb_release -cs` main" | sudo tee -a  /etc/apt/sources.list.d/llvm-apt.list
sudo apt-get update -y
# choose the latest one
sudo apt-get install -r clangd-20 clang-format-20
sudo ln -s /usr/bin/clangd-20 /usr/bin/clangd
sudo ln -s /usr/bin/clang-format-20 /usr/bin/clang-format
```

## desktop package
``` bash
sudo apt-get install -y \
    xorg dbus-x11 \
    bspwm rofi sxhkd polybar kitty picom \
    obs-studio \
    ranger fcitx5 lxappearance \
    neofetch xclip feh btop xautolock \
    pulseaudio alsa-base brightnessctl alsamixergui \
    libxrandr-dev
```

# lock screen
``` bash
git clone https://git.suckless.org/slock
cd slock
make all
sudo make install
cd .. && sudo rm -r slock

# enable slock@user.service
# /etc/systemd/system/slock@.service
# [Unit]
# Description=Lock X session using slock for user %i
# Before=sleep.target
#
# [Service]
# User=%i
# Environment=DISPLAY=:0
# ExecStartPre=/usr/bin/xset dpms force suspend
# ExecStart=/usr/bin/slock
#
# [Install]
# WantedBy=sleep.target
```

## zsh config
``` bash
# install oh my zsh & change theme to af-magic
sh -c "$(wget https://gitee.com/Devkings/oh_my_zsh_install/raw/master/install.sh -O -)" && \
sed -i 's/ZSH_THEME=\"[a-z0-9\-]*\"/ZSH_THEME="af-magic"/g' ~/.zshrc && \
chsh -s /bin/zsh && \
source ~/.zshrc
```

## fcitx5 theme
``` bash
# clone the src
git clone https://github.com/thep0y/fcitx5-themes.git
cd fcitx5-themes
mv macOS-* ~/.local/share/fcitx5/themes

# modify the config
# theme: macOS-{light, dark}
vim ~/.config/fcitx5/conf/classicui.conf
```

## configure touchpad
``` bash
# use this to find the id of touchpad
xinput list
# use this to check the properties of touchpad
xinput watch-props $id
# use this to change the property of touchpad
xinput set-prop $id $property $value

# you shoud focus these properties
# Tapping Enabled: 单击
# Natural Scrolling Enabled： 符合直觉的滑动
# Accel Speed: 滑动速度

# you can get the id use this
xinput list | grep "Touchpad" | awk -F"id=" {'print substr($2,0,2)'}
```

# screenshot
```bash
#!/bin/sh
scrot -e 'xclip -selection clipboard -t image/png -i $f'
```