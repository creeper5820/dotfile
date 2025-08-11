#!/bin/bash

# 设置路径
TARGET="/etc/pacman.conf"
SOURCE="./template/pacman.conf"
BACKUP="/etc/pacman.conf.bak"

# 检查源文件是否存在
if [ ! -f "$SOURCE" ]; then
    echo "错误：找不到模板文件 $SOURCE"
    exit 1
fi

# 备份原始 pacman.conf（如果存在）
if [ -f "$TARGET" ]; then
    echo "备份原始 pacman.conf 到 $BACKUP"
    sudo cp "$TARGET" "$BACKUP"
fi

# 替换 pacman.conf
echo "替换 pacman.conf..."
sudo cp "$SOURCE" "$TARGET"

echo "完成 ✅"
