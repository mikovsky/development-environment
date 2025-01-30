vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- basic
vim.keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal mode" })

-- vertical movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<A-j>", "jzz")
vim.keymap.set("n", "<A-k>", "kzz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- moving text
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("x", "H", "<gv")
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "L", ">gv")

-- text buffers
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("x", "<leader>P", '"_dp')
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- scala
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
