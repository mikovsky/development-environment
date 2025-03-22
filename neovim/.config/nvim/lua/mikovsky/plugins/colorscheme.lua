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
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "main",
        dark_variant = "main",
        extend_background_behind_borders = true,
        enable = {
          terminal = true,
        },
        styles = {
          bold = true,
          italic = false,
          transparency = false,
        },
      })
      -- vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        no_italic = true,
      })

      vim.cmd.colorscheme("catppuccin")
    end
  },
}
