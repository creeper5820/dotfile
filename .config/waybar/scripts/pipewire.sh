#!/bin/bash

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ |
    sed 's/Volume: //' |
    xargs -I {} bash -c 'qalc -t -s "decimal comma off" "{} * 100" | tail -1')

# 检查是否包含 MUTED 或 volume 为空或为0
if [[ "$volume" == *MUTED* ]] || [[ -z "$volume" ]] || [[ "$volume" == 0* ]]; then
    echo "MUTE"
else
    # 提取数字部分用于判断
    vol_num=$(echo "$volume" | grep -oE '^[0-9]+')
    if [[ -n "$vol_num" ]]; then
        if ((vol_num > 50)); then
            echo " $vol_num%"
        elif ((vol_num > 25)); then
            echo " $vol_num%"
        elif ((vol_num > 0)); then
            echo " $vol_num%"
        fi
    else
        echo "MUTE"
    fi
fi
