vim.cmd("let g:netrw_liststyle = 3")

-- basics
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 10
vim.opt.showmode = false
vim.opt.mouse = "a"

-- tabs & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- wrapping
vim.opt.wrap = false

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

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

-- infrastructure
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- enable highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('mikovsky-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

