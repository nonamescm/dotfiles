local opt = {silent = true}
local map = function(mode, keys, command)
	return vim.api.nvim_set_keymap(mode, keys, command, opt)
end

map("n", "tf", "<cmd>Telescope find_files<CR>")
map("n", "tg", "<cmd>Telescope live_grep<CR>")
map("n", "tb", "<cmd>Telescope buffers<CR>")
map("n", "th", "<cmd>Telescope help_tags<CR>")

require'plenary.filetype'.add_file('override')
