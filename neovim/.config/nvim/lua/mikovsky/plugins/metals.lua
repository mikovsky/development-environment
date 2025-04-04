local metals_settings = {
  enableSemanticHighlighting = true,
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
  superMethodLensesEnabled = true,
  serverProperties = {
    "-Xms1G",
    "-Xmx2G",
  },
  -- bloopSbtAlreadyInstalled = true,
  -- defaultBspToBuildTool = true,
  bloopJvmProperties = {
    "-Xms2G",
    "-Xmx6G",
    "-XX:+UseG1GC",
    "-XX:MaxMetaspaceSize=1G",
  },
}

local function metals_on_attach(_, buffer)
  local function map(mode, key, callback, desc)
    vim.keymap.set(mode, key, callback, { buffer = buffer, silent = true, desc = desc })
  end

  local supermethod_cmd = "<cmd>MetalsGotoSuperMethod<CR>"
  local organizeimports_cmd = "<cmd>MetalsOrganizeImports<CR>"
  local worksheet_cmd = "<cmd>lua require('metals').hover_worksheet()<CR>"
  local commands_cmd = "<cmd>lua require('telescope').extensions.metals.commands()<CR>"

  map("n", "gs", supermethod_cmd, "Metals: Goto Super Method")
  map("n", "<leader>co", organizeimports_cmd, "Metals: Organize Imports")
  map("n", "<leader>mw", worksheet_cmd, "Metals: Hover Worksheet")
  map("n", "<leader>mt", commands_cmd, "Metals: Show Commands")
end

return {
  {
    "scalameta/nvim-metals",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()

      metals_config.init_options.statusBarProvider = "off"
      metals_config.capabilities = require("blink.cmp").get_lsp_capabilities()
      metals_config.settings = metals_settings
      metals_config.on_attach = metals_on_attach

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
