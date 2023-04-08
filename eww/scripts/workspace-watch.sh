#!/usr/bin/env zsh
socat - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read ws; do
    if grep workspace <<< $ws 1>/dev/null 2>&1; then
        awk -F'>>' '{ print $2 }' <<< $ws
    fi
done
