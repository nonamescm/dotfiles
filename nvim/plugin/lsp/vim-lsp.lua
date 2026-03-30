local on_attach = require("lsp.on_attach")

vim.o.completeopt = "menuone,noinsert,noselect"

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local bufnr = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		on_attach(client, bufnr)
	end,
})

vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
	update_in_insert = true,
})

local border = {
	{ "🭽", "FloatBorder" }, { "▔", "FloatBorder" }, { "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" }, { "🭿", "FloatBorder" }, { "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" }, { "▏", "FloatBorder" },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = border })
