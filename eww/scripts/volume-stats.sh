#!/usr/bin/env bash
[ "$(amixer sget 'Master' | grep '\[off\]')" ] && echo "󰎊" || echo "󰎈"

pactl subscribe | grep "'change' on sink" --line-buffered | while read; do
	[ "$(amixer sget 'Master' | grep '\[off\]')" ] && echo "󰎊" || echo "󰎈"
done
