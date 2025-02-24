return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
        },
      },
      {
        "j-hui/fidget.nvim",
        opts = {},
      },
      {
        "nvim-java/nvim-java",
        config = function()
          require("java").setup({
            settings = {
              java = {
                configuration = {
                  runtimes = {
                    {
                      name = "Java 17",
                      path = "$HOME/.sdkman/candidates/java/17.0.13-amzn",
                      default = false,
                    },
                    {
                      name = "Java 23",
                      path = "$HOME/.sdkman/candidates/java/23.0.2-amzn",
                      default = true,
                    },
                  },
                },
              },
            },
          })
        end,
      },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          local function map(mode, key, callback, desc)
            vim.keymap.set(mode, key, callback, { desc = desc, buffer = event.buf, silent = true })
          end

          local builtin = require("telescope.builtin")
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

      require("mason").setup({})

      require("mason-lspconfig").setup({
        ensure_installed = { "bashls", "gopls", "lua_ls", "pyright", "tailwindcss", "ts_ls", "yamlls" },
        automatic_installation = false,
      })

      require("mason-tool-installer").setup({
        ensure_installed = { "black", "isort", "prettierd", "shfmt", "stylua" },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.bashls.setup({ capabilities = capabilities })
      lspconfig.gopls.setup({ capabilities = capabilities })
      lspconfig.groovyls.setup({
        capabilities = capabilities,
        cmd = { "java", "-jar", "/home/mike/.local/share/nvim/mason/packages/groovy-language-server" },
      })
      lspconfig.jdtls.setup({ capabilities = capabilities })
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.tailwindcss.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({ capabilities = capabilities })
      lspconfig.yamlls.setup({ capabilities = capabilities })
    end,
  },
}
