return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black", "isort" },
        javascript = { "prettier", "prettierd" },
        typescript = { "prettier", "prettierd" },
        css = { "prettier", "prettierd" },
        html = { "prettier", "prettierd" },
        json = { "prettier", "prettierd" },
        yaml = { "prettier", "prettierd" },
        markdown = { "prettier", "prettierd" },
        bash = { "shfmt" },
        proto = { "protols" },
      },
      format_on_save = {},
      notify_on_error = true,
    },
    init = function()
      vim.keymap.set("n", "<leader>cf", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, { desc = "Format Code" })
    end,
  },
}
