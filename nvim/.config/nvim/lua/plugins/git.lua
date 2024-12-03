return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    config = function()
      require('gitsigns').setup()

      vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', {})
      vim.keymap.set('n', '<leader>gib', ':Gitsigns toggle_current_line_blame<CR>', {})
      vim.keymap.set('n', '<leader>gz', ':Gitsigns reset_hunk<CR>', {})
      vim.keymap.set('n', '<leader>gb', ':Gitsigns blame<CR>', {})
    end,
  },
}
