#!/bin/bash

wget -O /tmp/llvm-snapshot.gpg.key https://apt.llvm.org/llvm-snapshot.gpg.key
sudo apt-key add /tmp/llvm-snapshot.gpg.key
rm /tmp/llvm-snapshot.gpg.key

sudo touch /etc/apt/sources.list.d/llvm-apt.list
sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/llvm-apt/jammy/ llvm-toolchain-jammy main" |\
sudo tee -a  /etc/apt/sources.list.d/llvm-apt.list
sudo apt-get update -y

version=`apt-cache search clangd- | grep clangd- | awk -F' ' '{print $1}' | sort -V | tail -1 | cut -d- -f2`
sudo apt-get install -y clangd-$version clang-format-$version
sudo ln -s /usr/bin/clangd-$version /usr/bin/clangd
sudo ln -s /usr/bin/clang-format-$version /usr/bin/clang-format