return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")

		vim.keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Next TODO comment" })

		vim.keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Prev TODO comment" })

		todo_comments.setup()
	end,
}
