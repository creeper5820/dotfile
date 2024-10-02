# Note
Xorg 环境默认export代理端口，注意检查网络环境(.xsession)

# Develop
## packages
``` bash
# basic develop packages
sudo apt-get install -y \
    build-essential lsb-release gnupg software-properties-common \
    wget curl unzip git zsh \
    gcc g++ gdb make cmake \
    gcc-arm-none-eabi

# get the latest clangd and clang-format from llvm
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/llvm-apt.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/llvm-apt/`lsb_release -cs`/ llvm-toolchain-`lsb_release -cs` main" | sudo tee -a  /etc/apt/sources.list.d/llvm-apt.list
sudo apt-get update -y
# choose the latest one
sudo apt-get install -y clangd-20 clang-format-20
sudo ln -s /usr/bin/clangd-20 /usr/bin/clangd
sudo ln -s /usr/bin/clang-format-20 /usr/bin/clang-format
```

## zsh config
``` bash
# install oh my zsh & change theme to af-magic
sh -c "$(wget https://gitee.com/Devkings/oh_my_zsh_install/raw/master/install.sh -O -)"

sed -i 's/ZSH_THEME=\"[a-z0-9\-]*\"/ZSH_THEME="af-magic"/g' ~/.zshrc
echo "setopt nonomatch" >> ~/.zshrc

chsh -s /bin/zsh
source ~/.zshrc

# if use ros2
source /opt/ros/humble/setup.zsh
eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"
```

## docker
run docker without sudo
```bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
```

set proxy for docker pulling
```bash
sudo mkdir -p /etc/systemd/system/docker.service.d 

sudo touch /etc/systemd/system/docker.service.d/http-proxy.conf

echo -e "[Service]\nEnvironment="HTTP_PROXY=http://127.0.0.1:7890"\n\
Environment="HTTPS_PROXY=http://127.0.0.1:7890"" |\
sudo tee -a /etc/systemd/system/docker.service.d/http-proxy.conf

sudo systemctl daemon-reload
sudo systemctl restart docker

# you can check
echo "DOCKER ENV"
sudo systemctl show --property=Environment docker
```

## qt installation

```bash
sudo apt-get install -y \
qtbase5-dev \
qt5-qmake \
qtcreator \
qttools5-dev-tools

# for pcl visualizer
sudo apt install libqt5opengl5-dev

# for qml live
sudo apt-get install qtdeclarative5-private-dev
sudo apt-get install qtbase5-private-dev

git clone http://code.qt.io/qt-apps/qmllive.git
cd qmllive
git checkout 5.15
qmake && make
sudo make install
```

# Desktop
## packages
``` bash
sudo apt-get install -y \
    xorg dbus-x11 \
    bspwm rofi sxhkd polybar kitty picom \
    obs-studio \
    ranger fcitx5 lxappearance \
    neofetch xclip feh btop xautolock net-tools \
    pulseaudio alsa-base brightnessctl alsamixergui \
    libxrandr-dev
```

## lock screen
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
xinput set-prop $id "libinput Tapping Enabled" 1
# Natural Scrolling Enabled： 符合直觉的滑动
xinput set-prop $id "libinput Natural Scrolling Enabled" 1
# Accel Speed: 滑动速度
xinput set-prop $id "libinput Accel Speed" 0.1

# you can get the id use this
xinput list | grep "Touchpad" | awk -F"id=" {'print substr($2,0,2)'}

# on thinkpad t480, the touchpad is named with "Synaptics"
```

## screenshot
```bash
#!/bin/sh
scrot -e 'xclip -selection clipboard -t image/png -i $f'
```

## fuck qq login in linux with docker

```bash
# this disable the appearance of "docker0"
# you can `ifconfig` to check this
echo "{\n  \"bridge\": \"none\"\n}" | sudo tee -a /etc/docker/daemon.json
sudo systemctl restart docker

# cancel it
sudo mv /etc/docker/daemon.json /etc/docker/daemon.json.bak

# cancel your cancel
sudo mv /etc/docker/daemon.json.bak /etc/docker/daemon.json
```
## more amazing picom
```bash
sudo apt-get install -y \
libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev \
libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev \
libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev libxcb-image0-dev \
libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev \
libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev libxext-dev meson \
ninja-build uthash-dev

git clone https://github.com/FT-Labs/picom.git
cd picom
meson setup --buildtype=release build
ninja -C build

mkdir -p ~/.app/picom
meson configure -Dprefix=~/.app/picom/ build
ninja -C build install
```
