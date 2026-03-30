local on_attach = require("lsp.on_attach")


local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt", "java" },
	callback = function()
		local metals_config = require("metals").bare_config()
		metals_config.init_options.statusBarProvider = "off"
		metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
		metals_config.on_attach = on_attach
		require("metals").initialize_or_attach(metals_config)
	end,
	group = nvim_metals_group,
})
