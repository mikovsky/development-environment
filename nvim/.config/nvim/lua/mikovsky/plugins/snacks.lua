return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {},
      picker = {
        sources = {
          explorer = {
            hidden = true,
          },
        },
      },
    },
    config = function(_, opts)
      local snacks = require("snacks")
      snacks.setup(opts)

      vim.keymap.set("n", "<leader>e", function()
        snacks.explorer.open({ follow_file = false })
      end, { desc = "Open Snacks Explorer" })
      vim.keymap.set("n", "<leader>fe", function()
        snacks.explorer.open({ follow_file = true })
      end, { desc = "Open Snacks Explorer" })
    end,
  },
}
