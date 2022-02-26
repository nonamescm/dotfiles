vim.o.completeopt = "menuone,noselect,noinsert"
vim.o.updatetime = 300
local cmp  = require('cmp')
local lspkind = require('lspkind')

cmp.setup {
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = lspkind.cmp_format({}),
	},
	completion = {
		completeopt = 'menuone,noinsert,noselect',
	},
	documentation = {
		border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
		winhighlight = 'FloatBorder:NormalFloat',
		maxheigth = math.floor(vim.fn.winheight(0) / 2),
		maxwidth = math.floor(vim.fn.winwidth(0) / 2),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'buffer' },
		{ name = "luasnip" }
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		})
	},
}
