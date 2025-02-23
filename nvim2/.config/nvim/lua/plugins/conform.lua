return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      bash = { "shmft" },
      css = { "prettierd" },
      html = { "prettierd" },
      javascript = { "prettierd" },
      json = { "prettierd" },
      lua = { "stylua" },
      proto = { "protols" },
      python = { "isort", "black" },
      typescript = { "prettierd" },
      yaml = { "prettierd" },
    },
  },
  init = function()
    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Code Format" })
  end,
}
