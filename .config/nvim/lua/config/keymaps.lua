-- System clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y", { desc = "Yank to system clipboard", noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p", { desc = "Paste from system clipboard after cursor", noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>P", "\"+P", { desc = "Paste from system clipboard before cursor", noremap = true })
