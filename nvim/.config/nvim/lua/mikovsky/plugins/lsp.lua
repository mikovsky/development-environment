return {
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lsp_config = require("lspconfig")

			lsp_config.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(event)
					local opts = { buffer = event.buf, silent = true }

					opts.desc = "Show LSP references"
					vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

					opts.desc = "Go to declaration"
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

					opts.desc = "Show LSP definitions"
					vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

					opts.desc = "Show LSP implementations"
					vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementation<CR>", opts)

					opts.desc = "Show LSP type definitions"
					vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

					opts.desc = "See available code actions"
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

					opts.desc = "Smart rename"
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

					opts.desc = "Show buffer diagnostics"
					vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

					opts.desc = "Show line diagnostics"
					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

					opts.desc = "Go to previous diagnostic"
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

					opts.desc = "Go to next diagnostic"
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

					opts.desc = "Show documentation on hover"
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

					opts.desc = "Restart LSP"
					vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
				end,
			})
		end,
	},
	{
		"scalameta/nvim-metals",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		ft = { "scala", "sbt", "java" },
		opts = function()
			local metals = require("metals")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.keymap.set("n", "<leader>mw", function()
				metals.hover_worksheet()
			end, { desc = "Metals: Hover Worksheet" })

			vim.keymap.set("n", "<leader>mt", function()
				require("telescope").extensions.metals.commands()
			end, { desc = "Metals: Show Commands" })

			local metals_config = metals.bare_config()

			metals_config.settings = {
				showImplicitArguments = true,
			}

			metals_config.init_options.statusBarProvider = "off"
			metals_config.capabilities = capabilities
			metals_config.on_attach = function(client, buffer)
				require("metals").setup_dap()
			end

			return metals_config
		end,
		config = function(self, metals_config)
			local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = self.ft,
				callback = function()
					require("metals").initialize_or_attach(metals_config)
				end,
				group = nvim_metals_group,
			})
		end,
	},
}
