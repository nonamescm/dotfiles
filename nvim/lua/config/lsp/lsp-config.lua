local capabilities = require("cmp_nvim_lsp").default_capabilities()
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
	"zls",
}

for _, server in ipairs(servers) do
	vim.lsp.config(server, {
		capabilities = capabilities
	})
end

vim.lsp.config("hls", {
	settings = {
		haskell = {
			formattingProvider = "fourmolu",
			plugin = {
				semanticTokens = {
					globalOn = true
				}
			}
		}
	}
})

vim.lsp.enable(servers)

