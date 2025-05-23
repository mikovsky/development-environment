return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    { "nvim-telescope/telescope-ui-select.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
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
        },
        path_display = {
          "filename_first",
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {},
        grep_string = {},
        lsp_definitions = {
          file_ignore_patterns = {},
        },
        lsp_references = {
          file_ignore_patterns = {},
        },
        lsp_implementations = {
          file_ignore_patterns = {},
        },
        lsp_declarations = {
          file_ignore_patterns = {},
        },
        lsp_type_definitions = {
          file_ignore_patterns = {},
        },
        lsp_document_symbols = {
          file_ignore_patterns = {},
        },
        lsp_dynamic_workspace_symbols = {
          file_ignore_patterns = {},
        },
      },
      extensions = {
        fzf = {},
        ["ui-select"] = { require("telescope.themes").get_dropdown() },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind files in cwd" })
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[F]ind string in cwd" })
    vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "[F]ind string under cursor in cwd" })
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[F]ind todos" })
    vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "[F]ind string in buffer" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[F]ind recently opened files" })
    vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind - resume searching" })
  end,
}
