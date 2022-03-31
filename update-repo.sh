#!/usr/bin/env zsh
WINDOW_SIZE=$(( $(tput cols) - 20 ))
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
CH=$CONFIG_HOME

repeat_str() {
	printf "$1%.0s" {0..$2}
}

load_status_bar() {
	local sleep_time=$(perl -E "say(${1:-5} / $WINDOW_SIZE);")
	for i in $(seq $WINDOW_SIZE); do
		printf "%s%s\r" $'\033[K' "[$(repeat_str "=" $i)>$(repeat_str " " $(( $WINDOW_SIZE - $i )))]"
		sleep $sleep_time
	done
	echo "[$( repeat_str "=" $(( $WINDOW_SIZE + 1 )) )>]"
	echo Done.
}

copy_files() {
	local files_to_copy=

	if test -z $1; then
		files_to_copy=("$CH/awesome" "$CH/nvim" "$CH/rofi" "$CH/kitty" "$HOME/.Xresources" $(ls $HOME/.zshrc*) "$CH/bspwm" "$CH/sxhkd" "$CH/polybar" "$CH/alacritty")
	else
		files_to_copy=($1)
	fi

	for file in $files_to_copy; do
		cp -r $file .
	done
}

if [ -z $1 ]; then
	echo "Copying configuration files." && copy_files & load_status_bar
else
	echo "Copying selected configuration files."
	for arg in $@; do
		case $arg in
			nvim) rm -rf nvim && copy_files "$CH/nvim" & load_status_bar 1;;
			awesome) rm -rf awesome && copy_files "$CH/awesome" & load_status_bar 1;;
			rofi) rm -rf rofi && copy_files "$CH/rofi" & load_status_bar 1;;
			kitty) rm -rf kitty && copy_files "$CH/kitty" & load_status_bar 1;;
			xterm) rm -rf .Xresources && copy_files "$HOME/.Xresources" & load_status_bar 1;;
			zsh) for file in $(ls /home/renamed/.zshrc*); do rm -rf $file && copy_files $file &; done&load_status_bar 1;;
			bspwm) rm -rf bspwm && copy_files "$CH/bspwm" & load_status_bar 1;;
			sxhkd) rm -rf sxhkd && copy_files "$CH/sxhkd" & load_status_bar 1;;
			polybar) rm -rf polybar && copy_files "$CH/polybar" & load_status_bar 1;;
			alacritty) rm -rf alacritty && copy_files "$CH/alacritty" & load_status_bar 1;;
			picom) rm -rf picom.conf && copy_files "$CH/picom.conf" & load_status_bar 1;;
			eww) rm -rf eww && copy_files "$CH/eww" & load_status_bar 1;;
			*) echo "Unexpected Argument: $arg"
		esac
	done
fi
