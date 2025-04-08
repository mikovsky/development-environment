return {
  {
    "vim-test/vim-test",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.g["test#scala#runner"] = "blooptest" -- "blooptest" or "sbttest"
      vim.g["test#strategy"] = "neovim" -- "neovim"

      vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", { desc = "[T]ests: Run Nearest Test" })
      vim.keymap.set("n", "<leader>tr", ":TestFile<CR>", { desc = "[T]ests: Run Test File" })
      vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>", { desc = "[T]ests: Run Test Suite" })
      vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "[T]ests: Run Last Test" })
      vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", { desc = "[T]ests: Visit Last Test" })
    end,
  },
}
