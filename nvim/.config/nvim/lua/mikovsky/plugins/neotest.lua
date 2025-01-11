return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"mikovsky/neotest-scala",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-scala"),
			},
		})

		local run_nearest = function()
			require("neotest").run.run()
		end

		local run_project_tests = function()
			require("neotest").run.run(vim.fn.getcwd())
		end

		local run_test_file = function()
			require("neotest").run.run(vim.fn.expand("%"))
		end

		local toggle_summary = function()
			require("neotest").summary.toggle()
		end

		local toggle_output = function()
			require("neotest").output.open({ enter = true })
		end

		local toggle_panel = function()
			require("neotest").output_panel.toggle()
		end

		vim.keymap.set("n", "<leader>ta", run_project_tests, { desc = "NeoTest - Run Tests in current dir" })
		vim.keymap.set("n", "<leader>tr", run_test_file, { desc = "NeoTest - Run Tests in current file" })
		vim.keymap.set("n", "<leader>tn", run_nearest, { desc = "NeoTest - Run Test on cursor" })
		vim.keymap.set("n", "<leader>ts", toggle_summary, { desc = "NeoTest - Toggle summary window" })
		vim.keymap.set("n", "<leader>to", toggle_output, { desc = "NeoTest - Toggle output on cursor" })
		vim.keymap.set("n", "<leader>tl", toggle_panel, { desc = "NeoTest - Toggle output panel" })
	end,
}
