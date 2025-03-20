return {
  "tpope/vim-dadbod",
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
  config = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.keymap.set("n", "<leader>ld", "<cmd>DBUIToggle<CR>", { desc = "DBUI: Toogle Database UI" })
  end,
}
