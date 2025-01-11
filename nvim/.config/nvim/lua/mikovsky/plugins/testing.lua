return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"stevanmilic/neotest-scala",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-scala")({
					runner = "sbt",
					framework = "munit",
				}),
			},
		})

		local run_tests = function()
			require("neotest").run.run(vim.fn.expand("%"))
		end

		local toggle_summary = function()
			require("neotest").summary.toggle()
		end

		vim.keymap.set("n", "<leader>tp", run_tests, { desc = "NeoTest - Run Test File" })
		vim.keymap.set("n", "<leader>to", toggle_summary, { desc = "NeoTest - Toggle Summary" })
	end,
}
