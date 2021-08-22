local cmd = vim.cmd
local bg = vim.o.background
local home = vim.fn.expand("$HOME")

cmd("hi clear")
cmd("syntax reset")

if bg == "dark" then
	dofile( home .. "/.config/nvim/lua/themes/dark/palenight.lua" )
elseif bg == "light" then
	dofile( home .. "/.config/nvim/lua/themes/light/palenight.lua" )
else
	dofile( home .. "/.config/nvim/lua/themes/light/palenight.lua" )
end
