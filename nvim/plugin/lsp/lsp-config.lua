local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
	"rust_analyzer",
	"clangd",
	"pyright",
	"lua_ls",
	"hls",
	"gleam",
	"nixd",
	"nil_ls",
}

for _, server in ipairs(servers) do
	vim.lsp.config[server] = vim.lsp.config[server] or {}
	vim.lsp.config[server].capabilities = capabilities
end

vim.lsp.enable(servers)

