return {
    "vim-test/vim-test",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        -- Używamy bloop do testów
        -- vim.g['test#scala#runner'] = 'blooptest'
        -- lub dla sbt:
        vim.g['test#scala#runner'] = 'sbttest'

        -- Strategie uruchamiania testów
        vim.g['test#strategy'] = 'neovim'

        -- Mapowania klawiszy
        vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>', { desc = "[T]ests: Run Nearest Test" })
        vim.keymap.set('n', '<leader>tr', ':TestFile<CR>', { desc = "[T]ests: Run Test File" })
        vim.keymap.set('n', '<leader>ts', ':TestSuite<CR>', { desc = "[T]ests: Run Test Suite" })
        vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', { desc = "[T]ests: Run Last Test" })
        vim.keymap.set('n', '<leader>tv', ':TestVisit<CR>', { desc = "[T]ests: Visit Last Test" })
    end
}
