vim.cmd("let g:netrw_liststyle = 3")

-- Left Column & similar settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Tabs & Spacing
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-- General Behaviors
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.timeoutlen = 1000
vim.opt.writebackup = false
vim.opt.cursorline = true
vim.opt.background = "dark"
vim.opt.backspace = "indent,eol,start"

-- Searching Behavior
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- enable highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("mikovsky-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
