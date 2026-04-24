local colors = require("colors")

-- Disable Default Vim Plugins
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

vim.o.background = "light"
vim.o.splitbelow = true
vim.o.wrap, vim.wo.wrap = false, false
vim.o.number, vim.wo.number = true, true
vim.o.cursorline, vim.wo.cursorline = true, true
vim.o.relativenumber, vim.wo.relativenumber = false, false
vim.o.foldenable = false
vim.o.mouse = "a"
vim.o.showtabline = 0
vim.o.termguicolors = true
vim.o.guicursor = "v-c-sm:block,c-i-ci-ve:ver25,r-cr-o:hor20"
vim.o.laststatus = 3
vim.o.tabstop, vim.bo.tabstop = 2, 2
vim.o.shiftwidth, vim.bo.shiftwidth = 2, 2

-- plugins that doesn"t need configuration requires
require("colorizer").setup()
vim.cmd("set background=dark")
vim.cmd("colorscheme bloop")

vim.cmd("highlight WinSeparator guifg=" .. colors.lightbg)
