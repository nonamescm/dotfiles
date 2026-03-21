setlocal tabstop=2 shiftwidth=2 expandtab
lua vim.api.nvim_set_hl(0, "@variable.member.nix", { link = "@attribute" })
