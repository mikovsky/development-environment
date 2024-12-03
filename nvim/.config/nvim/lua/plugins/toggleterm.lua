return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      close_on_exit = true,
    }

    vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', {})
    vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', {})

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      hidden = true,
      direction = 'float',
      float_opts = {
        border = 'double',
      },
      on_open = function(term)
        vim.cmd 'startinsert!'
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
      on_close = function(_)
        vim.cmd 'startinsert!'
      end,
    }

    function _Lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>lua _Lazygit_toggle()<CR>', { noremap = true, silent = true })
  end,
}
