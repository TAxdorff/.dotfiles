local opt = vim.opt --for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- show absolute line number on the cursor line

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance
opt.termguicolors= true
opt.background = "dark"
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on these positions

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vert window to right
opt.splitbelow = true --split horz window to the bottom 

-- change dashes to continue word
opt.iskeyword:append("-")

-- turn off swapfile
-- opt.swapfile = false
