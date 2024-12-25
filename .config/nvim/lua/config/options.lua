-- Colors
vim.opt.termguicolors = true -- true color support, required for tmux

-- UI
vim.opt.number = true                  -- line numbers on margin
vim.opt.relativenumber = true          -- relative line numbers on margin
vim.opt.cursorline = true              -- highlight current line
vim.opt.scrolloff = 5                  -- lines of context
vim.opt.sidescrolloff = 10             -- columns of context
vim.opt.cmdheight = 2                  -- height of cmds section
vim.opt.signcolumn = "yes"             -- always show sign column, otherwise would shift text on each line
vim.opt.shortmess:append({ c = true }) -- silence give search messages e.g. Match 1 of 2
vim.opt.showmode = true                -- silence mode messages

-- Tabs and Spaces
vim.opt.smartindent = true -- autoindent when starting new line
vim.opt.tabstop = 8        -- number of spaces TAB counts for
vim.opt.softtabstop = 4    -- same as tabstop but when performing editing operations
vim.opt.shiftwidth = 4     -- number of spaces for each step of indent
vim.opt.shiftround = true  -- round indent to multiple of shiftwidth
vim.opt.expandtab = true   -- insert spaces instead of TAB
vim.opt.autoindent = true
vim.opt.backspace = "indent,eol,start"
vim.opt.list = true -- show some invisible chars

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.grepprg = "rg --vimgrep"

-- Misc
vim.opt.spelllang = { "en" }
