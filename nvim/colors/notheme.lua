local cmd = vim.cmd

package.loaded['themes.notheme'] = nil

cmd("hi clear")
cmd("syntax reset")
vim.o.background = "dark"

require("themes.notheme")
