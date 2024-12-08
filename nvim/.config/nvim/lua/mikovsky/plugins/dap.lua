local setup_scala = function(dap)
	dap.configurations.scala = {
		{
			type = "scala",
			request = "launch",
			name = "Run/Test File",
			metals = {
				runType = "runOrTestFile",
			},
		},
		{
			type = "scala",
			request = "launch",
			name = "Test Target",
			metals = {
				runType = "testTarget",
			},
		},
	}
end

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Keymaps for Debugger
		vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step In" })
		vim.keymap.set("n", "<F2>", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<F4>", dapui.toggle, { desc = "Debug: See last results" })
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Breakpoint with Condition" })

		-- DAP UI setup
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		setup_scala(dap)
	end,
}
