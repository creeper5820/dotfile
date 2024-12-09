#!/bin/bash
openocd \
-f "interface/jlink.cfg" \
-f "target/stm32f1x.cfg" \
-c "program template.elf verify reset exit"