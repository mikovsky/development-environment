return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("tokyonight").setup({
        styles = {
          comments = {
            italic = false,
          },
          keywords = {
            italic = false,
          },
        },
      })
      -- vim.cmd.colorscheme("tokyonight-night")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        term_colors = true,
        integrations = {
          gitsigns = true,
          neotree = true,
          treesitter = true,
          notify = true,
          blink_cmp = true,
          fidget = true,
          harpoon = true,
          mason = true,
          copilot_vim = true,
          dap = true,
          dap_ui = true,
          telescope = true,
          lsp_trouble = true,
          which_key = true,
        },
      })

      local sign = vim.fn.sign_define
      sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
