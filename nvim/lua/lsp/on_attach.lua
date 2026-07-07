local function on_attach(client, bufnr)
	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

	if client and client.server_capabilities.semanticTokensProvider then
		vim.lsp.semantic_tokens.enable(false, { bufnr = bufnr })
	end

	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition)
	vim.keymap.set("n", "gz", vim.lsp.buf.implementation)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
	vim.keymap.set("n", "gr", vim.lsp.buf.references)
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
	vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end)
	vim.keymap.set("n", "<leader>k", function()
		vim.lsp.buf.hover({
			border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
		})
	end)
end

return on_attach
