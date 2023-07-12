-- system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y", {desc = "Yank to system clipboard", noremap = true})

-- telescope
local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc = "Find files"})
vim.keymap.set("n", "<leader>fe", function() builtin.find_files({ cwd = utils.buffer_dir() }) end, {desc = "Find files in buffer dir"})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc = "Live grep"})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc = "Buffers"})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {desc = "Help tags"})
vim.keymap.set("n", "<leader>fs", builtin.search_history, {desc = "Search history"})
vim.keymap.set("n", "<leader>fc", builtin.command_history, {desc = "Command history"})
vim.keymap.set("n", "<leader>ft", builtin.treesitter, {desc = "Treesitter"})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {desc = "Old files"})
