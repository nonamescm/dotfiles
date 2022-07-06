local vim = vim

-- plugins
require("packer").startup(function(use)
	-- packer
	use "wbthomason/packer.nvim"

	-- colors
	use "norcalli/nvim-colorizer.lua"
	use "nonamescm/notheme.nvim"

	-- syntax
	use "nonamescm/neofsharp.vim"

	-- git integration
	use {
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim"
	}

	-- lsp
	use "neovim/nvim-lspconfig"
	use "nvim-treesitter/nvim-treesitter"
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "onsails/lspkind-nvim" },
			{ "L3MON4D3/LuaSnip" }
		}
	}

	-- tabline/statusline
	use "akinsho/nvim-bufferline.lua"
	use "kyazdani42/nvim-web-devicons"
	use "nonamescm/galaxyline.nvim"

	-- others
	use "windwp/nvim-autopairs" -- auto open and close pairs
	use "kyazdani42/nvim-tree.lua" -- file manager
	use "lukas-reineke/indent-blankline.nvim" -- ident guides
	use "andweeb/presence.nvim" -- Rich presence
	use "glepnir/dashboard-nvim" -- dashboard screen
end)

-- Disable Default Vim Plugins
vim.g.loaded_gzip = 0
vim.g.loaded_tar = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_2html_plugin = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_spec = 0
vim.g.loaded_syncolor = 0
vim.g.asmsyntax = "nasm"

-- options
vim.g.markdown_fenced_languages = {
	"fs=fsharp",
	"js=javascript",
	"py=python",
	"rs=rust",
	"rb=ruby",
	"yex=yex",
	"scala=scala",
}

local opt, bopt, wopt = vim.o, vim.bo, vim.wo
opt.background = "light"
opt.splitbelow = true
opt.wrap, wopt.wrap = false, false
opt.number, wopt.number = true, true
opt.cursorline, wopt.cursorline = true, true
opt.relativenumber, wopt.relativenumber = true, true
opt.mouse = "a"
opt.tabstop, bopt.tabstop = 4, 4
opt.shiftwidth, bopt.shiftwidth = 4, 4
opt.expandtab = false
opt.showtabline = 2
opt.termguicolors = true
opt.guicursor = "v-c-sm:block,c-i-ci-ve:ver25,r-cr-o:hor20"

-- plugins that doesn"t need configuration requires
require("colorizer").setup()
vim.cmd("colorscheme notheme")
require("gitsigns").setup()

vim.cmd("command! Term split|term")
vim.cmd("command! VTerm belowright vsplit|term")
