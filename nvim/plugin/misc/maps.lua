local vim = vim

local opt = { silent = false }

-- MAPPINGS
vim.keymap.set("n", "<S-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
vim.keymap.set("n", "<S-x>", [[<Cmd>bdelete<CR>]], opt) -- close tab

-- move between tabs
vim.keymap.set("n", "<TAB>", [[<Cmd>bnext<CR>]], opt)
vim.keymap.set("n", "<S-TAB>", [[<Cmd><CR>]], opt)

-- Neotree bindings
vim.keymap.set("n", "<C-n>", [[<Cmd>Neotree float toggle<CR>]], opt)
vim.keymap.set("n", "<C-b>", [[<Cmd>Neotree float toggle source=buffers<CR>]], opt)
