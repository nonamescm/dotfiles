#!/usr/bin/env bash
X=$(awk -F"[][]" '{ print $2 }' <(amixer sget Master) | grep % | head -n 1)
echo "${X%?}"

pactl subscribe | grep "'change' on sink" --line-buffered | while read; do
	X=$(awk -F"[][]" '{ print $2 }' <(amixer sget Master) | grep % | head -n 1)
	echo "${X%?}"
done
