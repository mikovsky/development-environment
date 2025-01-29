return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black", "isort" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        bash = { "shfmt" },
      },
      format_on_save = {
        enabled = false,
      },
      notify_on_error = true,
    },
    init = function()
      vim.keymap.set("n", "<leader>cf", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, { desc = "Format Code" })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    config = function()
      require("ibl").setup({
        scope = {
          enabled = false,
        },
      })
    end,
  },
}
