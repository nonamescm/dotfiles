local vim = vim

local opt = {silent = true}
local map = vim.api.nvim_set_keymap
vim.g.mapleader = ","

-- MAPPINGS
map("n", "<S-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
map("n", "<S-x>", [[<Cmd>bdelete<CR>]], opt) -- close tab

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
vim.cmd[[tnoremap <esc> <C-\><C-n>]]
