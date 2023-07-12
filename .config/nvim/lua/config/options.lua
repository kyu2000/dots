-- Colors
vim.opt.termguicolors = true                    -- true color support

-- UI
vim.opt.number = true                           -- line numbers on margin
vim.opt.relativenumber = true                   -- relative line numbers on margin
vim.opt.cursorline = true                       -- highlight current line
vim.opt.scrolloff = 5                           -- lines of context
vim.opt.sidescrolloff = 10                      -- columns of context
vim.opt.cmdheight = 2                           -- height of cmds section
vim.opt.signcolumn = "yes"                      -- always show sign column, otherwise would shift text each line
vim.opt.shortmess:append({ c = true })
vim.opt.showmode = false

-- Tabs and Spaces
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.backspace = "indent,eol,start"
vim.opt.list = true                             -- show some invisible chars

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.grepprg = "rg --vimgrep"

-- Misc
vim.opt.spelllang = { "en" }
