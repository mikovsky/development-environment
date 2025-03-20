return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set("n", "<leader>cpe", "<cmd>Copilot enable<CR>", { desc = "Copilot: Enable" })
    vim.keymap.set("n", "<leader>cpd", "<cmd>Copilot disable<CR>", { desc = "Copilot: Disable" })
  end,
}
