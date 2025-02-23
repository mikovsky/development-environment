local function run_scala_file()
  local function get_package_name()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    for _, line in ipairs(lines) do
      local package_match = line:match("^%s*package%s+(.+)%s*$")
      if package_match then
        return package_match
      end
    end
    return nil
  end

  local package_name = get_package_name()
  local class_name = vim.fn.expand("%:t:r")
  local full_class_name = package_name and string.format("%s.%s", package_name, class_name) or class_name

  vim.cmd("split")
  vim.cmd("wincmd j")
  vim.cmd("resize 15")
  vim.cmd(string.format('term sbt "runMain %s"', full_class_name))
  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>sr", run_scala_file, { desc = "Run Scala File" })
