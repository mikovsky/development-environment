local function setup_keymaps(dap)
  local state = {
    frames_sidebar = nil,
    scopes_sidebar = nil,
    threads_sidebar = nil,
  }

  local function show_frames()
    local widgets = require("dap.ui.widgets")
    if state.frames_sidebar == nil then
      state.frames_sidebar = widgets.sidebar(widgets.frames, { width = 55 })
    end
    state.frames_sidebar.toggle()
  end

  local function show_scopes()
    local widgets = require("dap.ui.widgets")
    if state.scopes_sidebar == nil then
      state.scopes_sidebar = widgets.sidebar(widgets.scopes, { width = 55 })
    end
    state.scopes_sidebar.toggle()
  end

  local function show_threads()
    local widgets = require("dap.ui.widgets")
    if state.threads_sidebar == nil then
      state.threads_sidebar = widgets.sidebar(widgets.threads, { width = 55 })
    end
    state.threads_sidebar.toggle()
  end

  local function expression_hover()
    local widgets = require("dap.ui.widgets")
    widgets.hover()
  end

  local function expression_preview()
    local widgets = require("dap.ui.widgets")
    widgets.preview()
  end

  vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug - Step in" })
  vim.keymap.set("n", "<F2>", dap.step_out, { desc = "Debug - Step out" })
  vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Debug - Step over" })
  vim.keymap.set("n", "<F4>", dap.continue, { desc = "Debug - Continue" })
  vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug - Toggle breakpoint" })
  vim.keymap.set("n", "<leader>df", show_frames, { desc = "Debug - Show frames" })
  vim.keymap.set("n", "<leader>ds", show_scopes, { desc = "Debug - Show scopes" })
  vim.keymap.set("n", "<leader>dt", show_threads, { desc = "Debug - Show threads" })
  vim.keymap.set({ "n", "v" }, "<leader>dh", expression_hover, { desc = "Debug - Hover expression" })
  vim.keymap.set({ "n", "v" }, "<leader>dp", expression_preview, { desc = "Debug - Preview expression" })
end

local function setup_adapters(dap)
  dap.adapters.codelldb = {
    type = "executable",
    command = "codelldb",
  }
end

local function setup_configurations(dap)
  dap.configurations.c = {
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

  dap.configurations.cpp = dap.configurations.c
end

return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      dap.defaults.fallback.terminal_win_cmd = "15split new"
      setup_keymaps(dap)
      setup_adapters(dap)
      setup_configurations(dap)
    end,
  },
}
