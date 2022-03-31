#!/usr/bin/env bash
[ "$(amixer sget 'Master' | grep '\[off\]')" ] && echo "ﱙ" || echo "ﱘ"
