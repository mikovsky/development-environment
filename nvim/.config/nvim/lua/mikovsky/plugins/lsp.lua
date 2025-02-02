return {
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
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
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "pyright",
          "gopls",
          "pbls",
          "bashls",
          "clangd",
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
          "black",
          "isort",
          "prettier",
          "prettierd",
          "shfmt",
          "codelldb",
        },
      })
    end,
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
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {},
        ts_ls = {},
        pyright = {},
        gopls = {},
        pbls = {},
        bashls = {},
        clangd = {},
      },
    },
    config = function(_, opts)
      local lsp_config = require("lspconfig")

      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lsp_config[server].setup(config)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          local builtin = require("telescope.builtin")
          local options = { buffer = event.buf, silent = true }

          options.desc = "Show LSP references"
          vim.keymap.set("n", "gr", builtin.lsp_references, options)

          options.desc = "Show LSP definitions"
          vim.keymap.set("n", "gd", builtin.lsp_definitions, options)

          options.desc = "Go to declaration"
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)

          options.desc = "Show LSP implementations"
          vim.keymap.set("n", "gi", builtin.lsp_implementations, options)

          options.desc = "Show LSP type definitions"
          vim.keymap.set("n", "gt", builtin.lsp_type_definitions, options)

          options.desc = "See available code actions"
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, options)

          options.desc = "See available code lens"
          vim.keymap.set({ "n", "v" }, "<leader>cl", vim.lsp.codelens.run, options)

          options.desc = "Smart rename"
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, options)

          options.desc = "Show diagnostic"
          vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, options)

          options.desc = "Go to previous diagnostic"
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, options)

          options.desc = "Go to next diagnostic"
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, options)

          options.desc = "Show documentation on hover"
          vim.keymap.set("n", "K", vim.lsp.buf.hover, options)

          options.desc = "Show signature help on hover"
          vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, options)

          options.desc = "Restart LSP"
          vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", options)

          options.desc = "Show Symbols in Document"
          vim.keymap.set("n", "<leader>fds", builtin.lsp_document_symbols, options)

          options.desc = "Show Symbols in Workspace"
          vim.keymap.set("n", "<leader>fas", builtin.lsp_dynamic_workspace_symbols, options)
        end,
      })
    end,
  },
}
