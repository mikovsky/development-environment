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

          options.desc = "Show buffer diagnostics"
          vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", options)

          options.desc = "Show line diagnostics"
          vim.keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics<CR>", options)

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
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals = require("metals")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.keymap.set("n", "<leader>mw", function()
        metals.hover_worksheet()
      end, { desc = "Metals: Hover Worksheet" })

      vim.keymap.set("n", "<leader>mt", function()
        require("telescope").extensions.metals.commands()
      end, { desc = "Metals: Show Commands" })

      local metals_config = metals.bare_config()

      metals_config.settings = {
        enableSemanticHighlighting = true,
        showImplicitArguments = true,
        showImplicitConversionsAndClasses = true,
        showInferredType = true,
        superMethodLensesEnabled = true,
        testUserInterface = "Test Explorer",
        serverProperties = {
          "-Xmx4g",
          "-Xms1g",
          "-XX:+UseG1GC",
          "-Xss2m",
          "-XX:MetaspaceSize=1g",
          "-XX:MaxMetaspaceSize=2g",
        },
      }

      metals_config.init_options.statusBarProvider = "off"
      metals_config.capabilities = capabilities
      metals_config.on_attach = function(_, buffer)
        require("metals").setup_dap()
        vim.keymap.set(
          "n",
          "gs",
          "<cmd>MetalsGotoSuperMethod<CR>",
          { desc = "Metals: Goto Super Method", buffer = buffer, silent = true }
        )
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },
}
