local vim = vim

-- plugins
require[[packer]].startup(function(use)
	-- packer
	use "wbthomason/packer.nvim"

	-- colors
	use "navarasu/onedark.nvim"
	use "norcalli/nvim-colorizer.lua"

	-- syntax
	use "adelarsq/neofsharp.vim"

	-- lsp
	use "neovim/nvim-lspconfig"
	use "nvim-treesitter/nvim-treesitter"
	use "onsails/lspkind-nvim"
	use "hrsh7th/nvim-compe"
	use "sbdchd/neoformat"

	-- tabline/statusline
	use {
		"akinsho/nvim-bufferline.lua",
		requires = "kyazdani42/nvim-web-devicons"
	}
	use "glepnir/galaxyline.nvim"

	-- others
	use "windwp/nvim-autopairs" -- auto open and close pairs
	use "kyazdani42/nvim-tree.lua" -- file manager
	use "lukas-reineke/indent-blankline.nvim" -- ident guides
	use "kassio/neoterm" -- terminal
end)

--  options
local opt, bopt, wopt = vim.o, vim.bo, vim.wo
opt.splitbelow = true
wopt.foldmethod = 'indent'
opt.wrap, wopt.wrap = false, false
opt.number, wopt.number = true, true
opt.relativenumber, wopt.relativenumber = true, true
opt.mouse = "a"
opt.tabstop, bopt.tabstop = 4, 4
opt.shiftwidth, bopt.shiftwidth = 4, 4
opt.expandtab = false
opt.showtabline = 2
opt.termguicolors = true
opt.guicursor = "v-c-sm:block,c-i-ci-ve:ver25,r-cr-o:hor20"

-- plugins that doesn"t need configuration requires
require[[nvim-autopairs]].setup()
require[[indent_blankline]].setup()
require[[colorizer]].setup()
vim.cmd[[colorscheme palenight]]

vim.cmd[[command! Term split|term]]
vim.cmd[[command! VTerm belowright vsplit|term]]

-- lua files requires
require[[lsp]]
require[[tabline]]
require[[treesitter]]
require[[highlight]]
require[[compe-completion]]
require[[nvimtree]]
require[[statusline]]
require[[maps]]
