local function setup_dapui(dap, dapui)
  dapui.setup()
  dap.listeners.before.attach.dapui_config = dapui.open
  dap.listeners.before.launch.dapui_config = dapui.open
end

local function setup_keymaps(dap, dapui)
  vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug - Step in" })
  vim.keymap.set("n", "<F2>", dap.step_out, { desc = "Debug - Step out" })
  vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Debug - Step over" })
  vim.keymap.set("n", "<F4>", dap.continue, { desc = "Debug - Continue" })
  vim.keymap.set("n", "<F5>", dapui.toggle, { desc = "Debug - Toggle UI" })
  vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug - Toggle breakpoint" })
end

local function setup_c(dap)
  local configuration = {
    {
      name = "Launch File",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      args = function()
        return vim.split(vim.fn.input("Arguments: "), " ")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }

  dap.configurations.c = configuration
  dap.configurations.cpp = configuration
  dap.adapters.codelldb = {
    type = "executable",
    command = "codelldb",
  }
end

local function setup_go()
  require("dap-go").setup()
end

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      setup_dapui(dap, dapui)
      setup_keymaps(dap, dapui)

      -- Languages
      setup_c(dap)
      setup_go()
    end,
  },
}
