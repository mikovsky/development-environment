function AddKeymap(mode, key, command, desc)
    vim.keymap.set(mode, key, command, { silent = true, desc = desc or "" })
end

function VSCodeAction(action)
    return string.format("<cmd>lua require('vscode').action('%s')<CR>", action)
end

if vim.g.vscode then
    require("mikovsky.options")
    require("mikovsky.keymaps")
    require("mikovsky.lsp")
    require("mikovsky.harpoon")
    require("mikovsky.project-manager")
    require("mikovsky.tests")
    require("mikovsky.git")
else
    -- Do nothing for now
end
