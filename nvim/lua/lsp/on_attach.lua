local function on_attach(client, bufnr)
	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

	if client and client.server_capabilities.semanticTokensProvider then
		vim.lsp.semantic_tokens.enable(true, { bufnr = bufnr })
	end

	local opts = { buffer = bufnr, noremap = true, silent = true }

	vim.keymap.set("n", "<space>gd", vim.lsp.buf.declaration)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition)
	vim.keymap.set("n", "gz", vim.lsp.buf.implementation)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename)
	vim.keymap.set("n", "gr", vim.lsp.buf.references)
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.format)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end)
	vim.keymap.set("n", "k", function()
		vim.lsp.buf.hover({ border = "rounded" })
	end)
end

return on_attach
