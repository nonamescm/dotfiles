local vim = vim

-- plugins
require[[paq]] {
	-- colors
	"navarasu/onedark.nvim",
	"norcalli/nvim-colorizer.lua",

	-- syntax
	"adelarsq/neofsharp.vim",

	-- lsp
	"neovim/nvim-lspconfig",
	"nvim-treesitter/nvim-treesitter",
	"onsails/lspkind-nvim",
	"hrsh7th/nvim-compe",

	-- tabline/statusline
	"akinsho/nvim-bufferline.lua",
	"kyazdani42/nvim-web-devicons",
	"glepnir/galaxyline.nvim",

	-- others
	"windwp/nvim-autopairs", -- auto open and close pairs
	"kyazdani42/nvim-tree.lua", -- file manager
	"lukas-reineke/indent-blankline.nvim", -- ident guides
}

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
