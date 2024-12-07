vim.cmd("let g:netrw_liststyle = 3")

-- basics
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 10
vim.opt.showmode = false

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- wrapping
vim.opt.wrap = false

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- current line
vim.opt.cursorline = true

-- colors
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- backspace behavior
vim.opt.backspace = "indent,eol,start"

-- clipboard config
vim.opt.clipboard:append("unnamedplus")

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- enable highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('mikovsky-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
