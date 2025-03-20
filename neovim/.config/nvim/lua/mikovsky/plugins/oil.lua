return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == ".." or name == ".git"
        end,
      },
      float = {
        padding = 2,
        max_width = 0,
        max_height = 0,
        preview_split = "below",
      },
      win_options = {
        wrap = true,
      },
    })

    vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open OIL" })
  end,
}
