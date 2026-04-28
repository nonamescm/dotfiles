local colors = require("colors")
local vim = vim

vim.g.mapleader = " "

vim.pack.add({
	-- colors and themes
	"https://github.com/norcalli/nvim-colorizer.lua",
	"https://github.com/nonamescm/notheme.nvim",

	-- syntax
	"https://github.com/nvim-treesitter/nvim-treesitter",

	-- git interaction
	"https://github.com/lewis6991/gitsigns.nvim",


	-- LSP and completion
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/hrsh7th/cmp-buffer",
	"https://github.com/onsails/lspkind-nvim",
	"https://github.com/L3MON4D3/LuaSnip",

	-- Scala-specific LSP support
	"https://github.com/scalameta/nvim-metals",

	-- notification plugin
	"https://github.com/j-hui/fidget.nvim",

	-- tabline/statusline
	"https://github.com/akinsho/nvim-bufferline.lua",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",

	-- misc
	"https://github.com/windwp/nvim-autopairs", -- auto open and close pairs
	"https://github.com/nvim-neo-tree/neo-tree.nvim", -- file manager
	"https://github.com/lukas-reineke/indent-blankline.nvim", -- ident guides
	"https://github.com/glepnir/dashboard-nvim", -- dashboard screen
	"https://github.com/lervag/vimtex", -- LaTeX support
	"https://github.com/andweeb/presence.nvim",

	-- dependencies
	"https://github.com/MunifTanjim/nui.nvim", -- needed for neo-tree
	"https://github.com/nvim-lua/plenary.nvim", -- needed for gitsgins and neo-tree
})

require("gitsigns").setup()

vim.cmd("command! Term split|term")
vim.cmd("command! VTerm belowright vsplit|term")

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.treesitter.language.add(vim.bo.filetype) then
			vim.treesitter.start()
		end
	end
})

vim.api.nvim_set_keymap("n", "Q", "<cmd>bd<CR>", {})
