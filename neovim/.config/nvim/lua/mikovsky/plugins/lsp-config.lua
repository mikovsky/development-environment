return {
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "gopls",
          "lua_ls",
          "pyright",
          "ts_ls",
          "yamlls",
        },
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "prettier",
          "shfmt",
          "isort",
          "black",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      lspconfig.bashls.setup({ capabilities = capabilities })
      lspconfig.gopls.setup({ capabilities = capabilities })
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.protols.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({ capabilities = capabilities })
      lspconfig.yamlls.setup({ capabilities = capabilities })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          local builtin = require("telescope.builtin")
          local function map(mode, key, callback, desc)
            vim.keymap.set(mode, key, callback, { buffer = event.buf, silent = true, desc = desc })
          end

          map("n", "gr", builtin.lsp_references, "Show LSP references")
          map("n", "gd", builtin.lsp_definitions, "Show LSP definitions")
          map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
          map("n", "gi", builtin.lsp_implementations, "Show LSP implementations")
          map("n", "gt", builtin.lsp_type_definitions, "Show LSP type definitions")
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "See available code actions")
          map({ "n", "v" }, "<leader>cl", vim.lsp.codelens.run, "See available code lens")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename")
          map("n", "<leader>cd", vim.diagnostic.open_float, "Show diagnostic")
          map("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
          map("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic")
          map("n", "K", vim.lsp.buf.hover, "Show documentation on hover")
          map("n", "<leader>k", vim.lsp.buf.signature_help, "Show signature help on hover")
          map("n", "<leader>rs", ":LspRestart<CR>", "Restart LSP")
          map("n", "<leader>fds", builtin.lsp_document_symbols, "Show Symbols in Document")
          map("n", "<leader>fas", builtin.lsp_dynamic_workspace_symbols, "Show Symbols in Workspace")
        end,
      })
    end,
  },
}
