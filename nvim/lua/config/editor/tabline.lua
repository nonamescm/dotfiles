function get_listed_bufs()
	local function filter(bufnr)
		return vim.api.nvim_buf_get_option(bufnr, "buflisted")
	end
	return vim.tbl_filter(filter, vim.api.nvim_list_bufs())
end


