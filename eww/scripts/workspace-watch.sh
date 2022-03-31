#!/usr/bin/env bash
bspc subscribe desktop_focus | while read out; do
    id=$(awk -F' ' '{ print $3 }' <<< $out)
    echo $(bspc query -T -d $id|jq '.name' --raw-output)
done
