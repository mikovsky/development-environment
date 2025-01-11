return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
					["<space>"] = "none",
					["P"] = { "toggle_preview", config = { use_float = false } },
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
				git_status = {
					symbols = {
						unstaged = "󰄱",
						staged = "󰱒",
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "NeoTree: Toggle Explorer" })
		vim.keymap.set("n", "<leader>fe", "<cmd>Neotree reveal<CR>", { desc = "NeoTree: Toggle file in Explorer" })
	end,
}
