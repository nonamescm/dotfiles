local cmd = vim.cmd
local bg = vim.o.background
local home = vim.fn.expand("$HOME")

package.loaded['themes.dark.palenight'] = nil
package.loaded['themes.light.palenight'] = nil

cmd("hi clear")
cmd("syntax reset")

if bg == "dark" then
	require( "themes.dark.palenight" )
elseif bg == "light" then
	require("themes.light.palenight")
else
	require("themes.light.palenight")
end
