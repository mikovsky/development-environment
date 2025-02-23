---@diagnostic disable: missing-fields
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          scope_incremental = false,
          node_incremental = "<C-space>",
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
