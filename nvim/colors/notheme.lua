local cmd = vim.cmd
local home = vim.fn.expand("$HOME")

package.loaded['themes.notheme'] = nil

cmd("hi clear")
cmd("syntax reset")
vim.o.background = "dark"

require("themes.notheme")
