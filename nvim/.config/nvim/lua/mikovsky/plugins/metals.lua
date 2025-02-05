return {
  {
    "scalameta/nvim-metals",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "j-hui/fidget.nvim",
        opts = { notification = { window = { winblend = 0 } } },
      },
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
        bloopSbtAlreadyInstalled = true,
        defaultBspToBuildTool = true,
        enableSemanticHighlighting = true,
        showImplicitArguments = true,
        showImplicitConversionsAndClasses = true,
        showInferredType = true,
        superMethodLensesEnabled = true,
      }

      metals_config.init_options.statusBarProvider = "off"
      metals_config.capabilities = capabilities
      metals_config.on_attach = function(_, buffer)
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
