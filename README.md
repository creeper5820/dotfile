# dotfile

### Zsh config
``` zsh
# install oh my zsh & change theme to af-magic
sh -c "$(wget https://gitee.com/Devkings/oh_my_zsh_install/raw/master/install.sh -O -)" && \
sed -i 's/ZSH_THEME=\"[a-z0-9\-]*\"/ZSH_THEME="af-magic"/g' ~/.zshrc && \
chsh -s /bin/zsh && \
source ~/.zshrc
```

### Fcitx5 Theme
``` zsh
# clone the src
git clone https://github.com/thep0y/fcitx5-themes.git
cd fcitx5-themes
mv macOS-* ~/.local/share/fcitx5/themes

# modify the config
# theme: macOS-{light, dark}
vim ~/.config/fcitx5/conf/classicui.conf
```