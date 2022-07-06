local vim = vim

vim.o.completeopt = [[menuone,noinsert,noselect]]

local function on_attach(client)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(0, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(0, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		signs = true,
		update_in_insert = true,
	})

	-- Mappings.
	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "<space>gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end
end

local lspconf = require("lspconfig")

local servers = {
	"rust_analyzer",
	"fsautocomplete",
	"clangd",
	"pyright",
	"sumneko_lua",
	"hls",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

for _, server in ipairs(servers) do
	lspconf[server].setup {
		capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
		on_attach = on_attach,
		root_dir = vim.loop.cwd,
		handlers = handlers,
	}
end

lspconf["tsserver"].setup {
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
}

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconf["html"].setup {
	on_attach = on_attach,
	root_dir = vim.loop.cwd,
	capabilities = capabilities
}

lspconf["cssls"].setup {
	on_attach = on_attach,
	root_dir = vim.loop.cwd,
	capabilities = capabilities
}

-- replace the default lsp diagnostic letters with prettier symbols
local symbols = {
	Error = "",
	Warn = "",
	Info = "",
	Hint = "",
}

for name, symbol in pairs(symbols) do
	local group = "DiagnosticSign" .. name
	vim.fn.sign_define(group, { text = symbol, texthl = group, numhl = group })
end

-- taken from https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#borders
-- add borders to the default diagnostic floating windows
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or {
		{ "🭽", "FloatBorder" },

		{ "▔", "FloatBorder" },

		{ "🭾", "FloatBorder" },

		{ "▕", "FloatBorder" },

		{ "🭿", "FloatBorder" },

		{ "▁", "FloatBorder" },

		{ "🭼", "FloatBorder" },

		{ "▏", "FloatBorder" },
	}
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
