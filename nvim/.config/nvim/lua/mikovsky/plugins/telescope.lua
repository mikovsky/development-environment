return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "folke/todo-comments.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          layout_strategy = "vertical",
          file_ignore_patterns = {
            ".git/",
            ".metals/",
            ".bloop/",
            ".bsp/",
            "project/",
            "node%_modules/",
            "target/",
            ".idea/",
            ".vscode/",
            "venv/",
            "build/",
            ".mvn",
            ".settings",
          },
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        extensions = {
          fzf = {},
        },
      })

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind files in cwd" })
      vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[F]ind string in cwd" })
      vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "[F]ind string under cursor in cwd" })
      vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[F]ind todos" })
      vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "[F]ind string in buffer" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
}
