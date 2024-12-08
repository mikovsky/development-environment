return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")
		auto_session.setup({
			auto_save = false,
			auto_restore = false,
			auto_create = false,
			suppressed_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop", "~/" },
		})

		vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dit" })
		vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
	end,
}
