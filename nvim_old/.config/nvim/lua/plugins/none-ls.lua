return {
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
        },
      }
      vim.keymap.set('n', '<leader>fc', vim.lsp.buf.format, {})
    end,
  },
  {
    'jay-babu/mason-null-ls.nvim',
    config = function()
      require('mason-null-ls').setup {
        ensure_installed = { 'stylua' },
      }
    end,
  },
}
