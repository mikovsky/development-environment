return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvim_tree = require("nvim-tree")

		-- disable netrw at the beginning
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- enable 24-bit color
		vim.opt.termguicolors = true

		nvim_tree.setup({
			view = {
				width = 45,
				relativenumber = true,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "",
							arrow_open = "",
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store", ".idea", ".vscode" },
			},
			git = {
				ignore = false,
			},
		})

		vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current opened file" })
		vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
	end,
}
