local on_attach = function()
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
  vim.keymap.set('n', 'gds', vim.lsp.buf.document_symbol, {})
  vim.keymap.set('n', 'gws', vim.lsp.buf.workspace_symbol, {})
  vim.keymap.set('n', '<leader>cl', vim.lsp.codelens.run, {})
  vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, {})
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
end

return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls' },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require 'lspconfig'

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }
    end,
  },
  {
    'scalameta/nvim-metals',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    ft = { 'scala', 'sbt', 'java' },
    keys = {
      {
        '<leader>mw',
        function()
          require('metals').hover_worksheet()
        end,
        desc = 'Metals Worksheet',
      },
      {
        '<leader>mt',
        function()
          require('telescope').extensions.metals.commands()
        end,
        desc = 'Telescope Metals Commands',
      },
    },
    opts = function()
      local metals_config = require('metals').bare_config()

      metals_config.settings = {
        showImplicitArguments = true,
      }

      metals_config.init_options.statusBarProvider = 'off'
      metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities()

      metals_config.on_attach = function(client, buffer)
        require('metals').setup_dap()
        on_attach()
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        pattern = self.ft,
        callback = function()
          require('metals').initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },
}
