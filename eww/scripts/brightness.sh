#!/usr/bin/env bash
inotifywait -r -m -e modify /sys/class/backlight/intel_backlight/actual_brightness 2>&1 | while read; do
	echo $(xbacklight -get)
done
