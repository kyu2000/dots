vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit" },
  callback = function(event)
    local buf = event.buf
    vim.bo[buf].textwidth = 72
    vim.wo.colorcolumn = "+1"
    vim.wo.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lua" },
  callback = function(event)
    local buf = event.buf
    vim.bo[buf].softtabstop = 2
    vim.bo[buf].shiftwidth = 2
  end,
})
