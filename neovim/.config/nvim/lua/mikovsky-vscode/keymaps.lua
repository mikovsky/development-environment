-- General
AddKeymap("n", "<Esc>", ":nohlsearch<CR>")

-- Vertical Movement
AddKeymap("n", "<C-d>", "<C-d>zz")
AddKeymap("n", "<C-u>", "<C-u>zz")
AddKeymap("n", "<C-D>", "jzz")
AddKeymap("n", "<C-U>", "kzz")
AddKeymap("n", "{", "{zz")
AddKeymap("n", "}", "}zz")
AddKeymap("n", "n", "nzzzv")
AddKeymap("n", "N", "Nzzzv")

-- Moving Text
AddKeymap("n", "J", "mzJ`z")
AddKeymap("x", "H", "<gv")
AddKeymap("x", "J", ":m '>+1<CR>gv=gv")
AddKeymap("x", "K", ":m '<-2<CR>gv=gv")
AddKeymap("x", "L", ">gv")

-- Text Buffers
AddKeymap("x", "<leader>p", '"_dP')
AddKeymap("x", "<leader>P", '"_dp')
AddKeymap({ "n", "v" }, "<leader>d", [["_d]])

-- Searching
AddKeymap("n", "<leader>ff", VSCodeAction("workbench.action.quickOpen"))
AddKeymap("n", "<leader>fs", VSCodeAction("workbench.action.quickTextSearch"))
AddKeymap("n", "<leader>fb", VSCodeAction("actions.find"))

-- Others
AddKeymap("n", "<leader>nx", VSCodeAction("notifications.clearAll"))
AddKeymap("n", "<leader>tt", VSCodeAction("workbench.action.terminal.toggleTerminal"))
