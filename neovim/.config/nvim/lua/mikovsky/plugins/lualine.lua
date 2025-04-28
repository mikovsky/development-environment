local function get_total_lines_and_characters_in_line()
  local characters = tostring(vim.fn.col("$") - 1)
  return "%L | " .. characters
end

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "tokyonight-night",
          disabled_filetypes = {
            statusline = {
              "neo-tree",
            },
          },
        },
        sections = {
          lualine_z = { "location", get_total_lines_and_characters_in_line },
        },
      })
    end,
  },
}
