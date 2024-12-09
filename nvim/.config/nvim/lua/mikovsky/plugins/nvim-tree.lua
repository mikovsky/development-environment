local on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    local opts = function(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    -- Include default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- Add custom mappings
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close"))
    vim.keymap.set("n", "l", api.node.open.edit, opts("Open/Edit"))
    vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvim_tree = require("nvim-tree")
        local nvim_tree_api = require("nvim-tree.api")

        -- disable netrw at the beginning
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- enable 24-bit color
        vim.opt.termguicolors = true

        nvim_tree.setup({
            on_attach = on_attach,
            view = {
                width = 40,
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

        vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "nvim-tree: Toggle file explorer" })
        vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "nvim-tree: Toggle file explorer on current opened file" })
        vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "nvim-tree: Collapse file explorer" })
        vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "nvim-tree: Refresh file explorer" })
    end,
}
