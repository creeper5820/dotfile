#!/bin/bash

sudo apt-get update -y

sudo apt-get install -y \
    gcc-arm-none-eabi openocd

echo "transport select swd" |\
sudo tee -a /usr/share/openocd/scripts/interface/jlink.cfg

# openocd \
# -f interface/jlink.cfg \
# -f target/stm32f4x.cfg \
# -c program template.elf \
# verify reset exit