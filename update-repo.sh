#!/usr/bin/env zsh
WINDOW_SIZE=$(( $(tput cols) - 20 ))
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
CH=$CONFIG_HOME

repeat_str() {
	printf "$1%.0s" {0..$2}
}

load_status_bar() {
	local sleep_time=$(perl -E "say(8 / $WINDOW_SIZE);")
	for i in $(seq $WINDOW_SIZE); do
		printf "%s%s\r" $'\033[K' "[$(repeat_str "=" $i)>$(repeat_str " " $(( $WINDOW_SIZE - $i )))]"
		sleep $sleep_time
	done
}

copy_files() {
	local files_to_copy=("$CH/awesome" "$CH/nvim" "$CH/rofi" "$HOME/.Xresources" "$(ls /home/renamed/.zshrc*)")

	for file in $files_to_copy; do
		cp -r $file .
	done
}

copy_files & load_status_bar
