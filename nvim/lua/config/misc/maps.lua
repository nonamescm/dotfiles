local opt = { silent = false }

-- MAPPINGS
vim.keymap.set("n", "<S-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
vim.keymap.set("n", "<S-x>", [[<Cmd>bdelete<CR>]], opt) -- close tab

-- Neotree bindings
vim.keymap.set("n", "<C-n>", [[<Cmd>Neotree float toggle<CR>]], opt)
vim.keymap.set("n", "<C-b>", [[<Cmd>Neotree buffers float toggle dir=/<CR>]], opt)
