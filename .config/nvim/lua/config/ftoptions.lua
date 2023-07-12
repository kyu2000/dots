vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = { "gitcommit" },
    command = "setlocal textwidth=72 colorcolumn=+1"
})
