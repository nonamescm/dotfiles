#!/usr/bin/env bash
for dir in */; do
	dir=$(awk -F/ '{print $1}' <<< $dir)
	path="$HOME/.config/$dir"

	echo -n "$dir: install? [y/N] "
	read answer

	if [ "$answer" != "y" ]; then
		echo "skipping $dir"
		continue
	fi

	if test -d ~/.config/$dir; then
		echo "~/.config/$dir already exists"
		echo -n "are you sure you want to overwrite it? [y/N] "
		read answer
	fi

	if [ "$answer" != "y" ]; then
		echo "skipping $dir"
		continue
	fi

	rm -rf "$path"

	ln -s $( realpath $dir ) ~/.config/
done
