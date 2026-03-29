-- 1. General Options
vim.o.completeopt = "menuone,noinsert,noselect"

-- 2. Global LSP Logic (The new "on_attach")
-- This triggers whenever any LSP connects to a buffer.
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local bufnr = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

		if client then
			client.server_capabilities.semanticTokensProvider = nil
		end

		local opts = { buffer = bufnr, noremap = true, silent = true }

		vim.keymap.set('n', '<space>gd', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gz', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
		vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
		vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<space>f', function() 
			vim.lsp.buf.format { async = true } 
		end, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
	end,
})

-- 3. Diagnostics UI
vim.diagnostic.config({
	virtual_text = false, -- Matches your old 'handlers' override
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN]  = "",
			[vim.diagnostic.severity.INFO]  = "",
			[vim.diagnostic.severity.HINT]  = "",
		},
	},
	update_in_insert = true,
})

-- 4. Server Configuration
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- List of servers to enable
local servers = {
	"rust_analyzer",
	"clangd",
	"pyright",
	"lua_ls",
	"hls",
	"gleam",
	"nixd",
	"nil_ls",
	"metals",
}

-- Apply capabilities to all and enable
for _, server in ipairs(servers) do
	-- Merge capabilities into the server config if not already defined
	vim.lsp.config[server] = vim.tbl_deep_extend("force", vim.lsp.config[server] or {}, {
		capabilities = capabilities
	})
end

vim.lsp.enable(servers)

local border = {
	{ "🭽", "FloatBorder" }, { "▔", "FloatBorder" }, { "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" }, { "🭿", "FloatBorder" }, { "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" }, { "▏", "FloatBorder" },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = border })

