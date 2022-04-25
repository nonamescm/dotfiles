#!/usr/bin/env zsh
for dir in */; do
	dir=$(awk -F/ '{print $1}' <<< $dir)
	config="$HOME/.config/$dir"

	echo -n "$dir: install? [y/N] "
	read answer

	if test -d ~/.config/$dir && [ "$answer" == "y" ]; then
		echo "~/.config/$dir already exists"
		echo -n "are you sure you want to overwrite it? [y/N] "
		read answer
	fi

	if [ "$answer" != "y" ]; then
		echo "skipping $dir"
		continue
	fi

	rm -rf "$config"

	ln -s $( realpath $dir ) ~/.config/
done
