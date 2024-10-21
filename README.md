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

## ESP32 Arduino on PlatformIO with clangd
说实话，嵌入式可是最纯正的一条C系命途，不兼容clangd真是违逆天理，不但如此，还和微软的插件相互勾结，具为一丘之貉

但说到底它终究脱离不了C的体系，纵使包裹了一层Arduino的面纱

微软维护的Arduino插件已经无了，Arduino IDE现在还很神经，只能期望使用PlatformIO来管理Arduino项目，先前折腾ESP32 IDF框架时发现了适用于IDF的LLVM-Project，我想这是不是而也同样运用于PlatformIO上，毕竟工具链还是那一套，只是裹上了一层Arduino

至于我为什么不使用`ESP32-IDF`框架，我只能说这个框架实在是有点不合我意，不如使用简单易懂的Arduino来开发，暂时放置一下大脑，享受一下在单片机平台使劲用各种标准库，哪管它什么都没写便占了一半Flash

这是在STM32不曾感受过的开发体验！

### 首先，你要把compile_commands.json弄出来
把这一句添加进项目的 `platformio.ini` 中

```
extra_scripts = pre:extra_script.py
```
然后在更目录新建一个文件 `extra_script.py`，将下面的内容复制进去
```py
import os
Import("env")

# include toolchain paths
env.Replace(COMPILATIONDB_INCLUDE_TOOLCHAIN=True)

# override compilation DB path
env.Replace(COMPILATIONDB_PATH=os.path.join("$BUILD_DIR", "compile_commands.json"))
```
然后在你的项目根目录下的终端执行（上面这一驼好像不是必要的，只是设置一些环境变量，有待查验，[这是依据](https://github.com/platformio/platformio-core/issues/4092)）

```bash
pio run -t compiledb
```

`pio`是 platformio 的工具，你很可能在环境变量中找不到它，你可以手动把他暴露出来，这是我的路径：
```
pio: /home/creeper/.platformio/penv/bin/pio
```
它随 platformio 的 vscode 插件一并安装好了，也可以自己去找官方文档下载一个，apt仓库大抵是没有这个的

运行上面指令后之后便可以在这个目录下找到： `.pio/build/esp32dev/compile_commands.json`，把它拉到根目录，或者指定一下 `clangd` 的检索目录

### 编译一份特化的clangd
（MD，边编译边写文档卡死我了，全核编译太狠了）

没错，原版llvm是不适配ESP32项目的，你需要下载一份修改过的LLVM源码自己编译安装才可以使用

[这里是ESP32-LLVM的仓库](https://github.com/espressif/llvm-project)

找你个你喜欢的地方，把一整个项目clone下来，说实话还挺大的，然后进入到项目根目录，使用下面的指令编译你需要的**clangd**
```bash
mkdir build && cd build  
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS='clang;clang-tools-extra' ../llvm
cmake --build . --target clangd
```
之后是漫长的等待，我第一次编译时把全家桶都编译了，近一个小时的电脑CPU使用权被强制剥夺

编译完了后你可以在根目录下的bin目录找到可执行文件`clangd`和一些必要的工具链，找到vscode中clangd的配置文件，把clangd的路径设置为你刚编译好的`clangd`即可，我的是这样子的：
```
/home/creeper/llvm-project/build/bin/clangd
```

不建议将`clangd`链接到环境中，毕竟这个是esp32项目only的，其他的cpp项目还是用最新的正版clangd吧！

### 写一点配置文件
编译好后还是不能直接使用，你需要写一点配置文件，这些都放在项目根目录就行

这是 `.clang-format`，代码格式化需要用到的，不是必须
```.clang-format
Language: Cpp
BasedOnStyle: WebKit
BreakBeforeBraces: Attach
```
这是`.clangd`，配置语言服务器clangd的，必要，因为有一些`clangd`无法识别的编译flag
```.clangd
CompileFlags:
  Remove: [-m*, -f*]
```

但做完以上步骤，你可能还会遇到一些问题，比如：[Error typedef redefinition](https://forum.arduino.cc/t/error-typedef-redefinition/973743/3)，[Errors with clangd LSP server when using generated compile_commands.json](https://github.com/platformio/platformio-core/issues/4092)，但大部分的功能已经完备，你只需要忍受一点点奇怪的报错提示，或者，你有代码洁癖，那便试试解决他们吧！

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
