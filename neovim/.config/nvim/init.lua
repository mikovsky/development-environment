if vim.g.vscode then
    function AddKeymap(mode, key, command, desc)
        vim.keymap.set(mode, key, command, { silent = true, desc = desc or "" })
    end
    
    function VSCodeAction(action)
        return string.format("<cmd>lua require('vscode').action('%s')<CR>", action)
    end

    require("mikovsky-vscode.options")
    require("mikovsky-vscode.keymaps")
    require("mikovsky-vscode.lsp")
    require("mikovsky-vscode.harpoon")
    require("mikovsky-vscode.tests")
    require("mikovsky-vscode.git")
else
    require("mikovsky.core")
    require("mikovsky.lazy")
end
