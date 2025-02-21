return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "bashls", "clangd", "jdtls", "ts_ls" }
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = { "stylua", "prettier", "shfmt", "codelldb", "java-debug-adapter", "java-test" },
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "nvim-java/nvim-java",
    config = function()
      require("java").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- setup the lua language server
      lspconfig.lua_ls.setup({})

      -- setup the bash language server
      lspconfig.bashls.setup({})

      -- setup the clang language server
      lspconfig.clangd.setup({ filetypes = { "c", "cpp" } })

      -- setup the typescript language server
      lspconfig.ts_ls.setup({})

      -- setup the java language server
      lspconfig.jdtls.setup({})

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          local builtin = require("telescope.builtin")
          local function map(mode, key, cmd, desc)
            vim.keymap.set(mode, key, cmd, { desc = desc, buffer = event.buf, silent = true })
          end

          map("n", "<leader>cr", builtin.lsp_references, "[C]ode - Show LSP references")
          map("n", "<leader>cd", builtin.lsp_definitions, "[C]ode - Show LSP definitions")
          map("n", "<leader>cD", vim.lsp.buf.declaration, "[C]ode - Go to declaration")
          map("n", "<leader>ci", builtin.lsp_implementations, "[C]ode - Show LSP implementations")
          map("n", "<leader>ctd", builtin.lsp_type_definitions, "[C]ode - Show LSP type definitions")
          map("n", "<leader>ch", vim.lsp.buf.hover, "[C]ode - Show documentation on hover")
          map("n", "<leader>cs", vim.lsp.buf.signature_help, "[C]ode - Show signature help on hover")
          map("n", "<leader>cn", vim.lsp.buf.rename, "[C]ode - Smart rename")
          map("n", "<leader>cd", vim.diagnostic.open_float, "[C]ode - Show diagnostic")
          map("n", "<leader>cfds", builtin.lsp_document_symbols, "[C]ode - Show Symbols in Document")
          map("n", "<leader>cfas", builtin.lsp_dynamic_workspace_symbols, "[C]ode - Show Symbols in Workspace")
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "[C]ode - See available code actions")
          map({ "n", "v" }, "<leader>cl", vim.lsp.codelens.run, "[C]ode - See available code lens")
          map("n", "[d", vim.diagnostic.goto_prev, "[C]ode - Go to previous diagnostic")
          map("n", "]d", vim.diagnostic.goto_next, "[C]ode - Go to next diagnostic")
          map("n", "<leader>crs", ":LspRestart<CR>", "[C]ode - Restart LSP")
        end,
      })

    end,
  },
}
