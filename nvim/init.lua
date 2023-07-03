local vim = vim

-- plugins
require("packer").startup(function(use)
	-- packer
	use "wbthomason/packer.nvim"

	-- colors
	use "norcalli/nvim-colorizer.lua"
	use "nonamescm/notheme.nvim"
	use {
		"nocksock/bloop.nvim",
		requires = "rktjmp/lush.nvim",
	}

	-- syntax
	use "nonamescm/neofsharp.vim"
	use "alaviss/nim.nvim"
	use "nvim-treesitter/nvim-treesitter"
	use "nvim-treesitter/playground"
	use "p00f/nvim-ts-rainbow"

	-- git integration
	use {
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim"
	}

	-- lsp
	use "neovim/nvim-lspconfig"
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"onsails/lspkind-nvim",
			"L3MON4D3/LuaSnip"
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
	use "rcarriga/nvim-notify" -- better notifications
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

vim.o.background = "light"
vim.o.splitbelow = true
vim.o.wrap, vim.wo.wrap = false, false
vim.o.number, vim.wo.number = true, true
vim.o.cursorline, vim.wo.cursorline = true, true
vim.o.relativenumber, vim.wo.relativenumber = true, true
vim.o.foldenable = false
vim.o.mouse = "a"
vim.o.tabstop, vim.bo.tabstop = 4, 4
vim.o.shiftwidth, vim.bo.shiftwidth = 4, 4
vim.o.expandtab = false
vim.o.showtabline = 2
vim.o.termguicolors = true
vim.o.guicursor = "v-c-sm:block,c-i-ci-ve:ver25,r-cr-o:hor20"
vim.o.laststatus = 3

-- plugins that doesn"t need configuration requires
require("colorizer").setup()
vim.cmd("set background=dark")
vim.cmd("colorscheme bloop")

require("gitsigns").setup()

vim.cmd("command! Term split|term")
vim.cmd("command! VTerm belowright vsplit|term")
