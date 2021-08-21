hi clear
syntax reset

if &background == "dark"
	luafile $HOME/.config/nvim/lua/themes/dark/palenight.lua
elseif &background == "light"
	luafile $HOME/.config/nvim/lua/themes/light/palenight.lua
else
	luafile $HOME/.config/nvim/lua/themes/dark/palenight.lua
endif
