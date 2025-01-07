return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({})

		vim.keymap.set("n", "<leader>jt", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon: Toggle Quick Menu" })

		vim.keymap.set("n", "<leader>jr", function()
			harpoon:list():add()
		end, { desc = "Harpoon: Add" })

		vim.keymap.set("n", "<leader>jf", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon: Select 1" })

		vim.keymap.set("n", "<leader>jd", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon: Select 2" })

		vim.keymap.set("n", "<leader>js", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon: Select 3" })

		vim.keymap.set("n", "<leader>ja", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon: Select 4" })
	end,
}
