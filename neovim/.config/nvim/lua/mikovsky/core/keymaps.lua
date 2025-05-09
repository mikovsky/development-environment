vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- basic
vim.keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal mode" })

-- vertical movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "center cursor when scrolling down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "center cursor when scrolling up" })
vim.keymap.set("n", "<A-j>", "jzz", { desc = "center cursor when moving down" })
vim.keymap.set("n", "<A-k>", "kzz", { desc = "center cursor when moving up" })
vim.keymap.set("n", "{", "{zz", { desc = "center cursor when moving to previous paragraph" })
vim.keymap.set("n", "}", "}zz", { desc = "center cursor when moving to next paragraph" })
vim.keymap.set("n", "n", "nzzzv", { desc = "center cursor when searching forward" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "center cursor when searching backward" })

-- moving text
vim.keymap.set("n", "J", "mzJ`z", { desc = "join lines and keep cursor in the same place" })
vim.keymap.set("x", "H", "<gv", { desc = "move selected text left" })
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", { desc = "move selected text down" })
vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", { desc = "move selected text up" })
vim.keymap.set("x", "L", ">gv", { desc = "move selected text right" })

-- text buffers
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "paste selected text after without losing it" })
vim.keymap.set("x", "<leader>P", '"_dp', { desc = "paste selected text before witout losing it" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "delete withour overwriting the default register" })

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
