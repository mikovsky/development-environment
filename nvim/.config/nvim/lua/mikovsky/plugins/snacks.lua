return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {},
      indent = { animate = { enabled = false }, scope = { enabled = false } },
    },
    config = function(_, opts)
      local snacks = require("snacks")
      snacks.setup(opts)

      vim.keymap.set("n", "<leader>gg", function()
        snacks.lazygit.open()
      end, { desc = "Open Lazygit" })
    end,
  },
}
