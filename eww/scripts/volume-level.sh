#!/usr/bin/env bash
X=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))
echo "${X%?}"
