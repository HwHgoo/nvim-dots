local config = {}

function config.gitsigns()
    if not packer_plugins['plenary.nvim'].loaded then
        vim.cmd [[packadd plenary.nvim]]
    end

    require("gitsigns").setup {}
end

function config.nvim_tree()
    require('nvim-tree').setup{
        auto_close = 1,
        follow = 1,
        follow_update_path = 1,
        hide_dotfiles = 0,
        highlight_opened_files = 1,
        tab_open = 1,
        lsp_diagnostics = 1,
        disable_netrw = 1,
        hijack_netrw = 1,
    }

    local g = vim.g
    --g.nvim_tree_show_icons = {
    --    git = 0,
    --    folders = 1,
    --    folder_arrows = 1
    --}
    g.nvim_tree_icons = {
        default = '',
        symlink = '',
        git = {
            staged = '✓',
            unstaged = '',
            unmerged = '',
            renamed = '',
            untracked = '★ ',
            deleted = '',
            ignored = '◌ ',
        },
        folder = {
            arrow_open = '',
            arrow_close = '',
            default = '',
            open = '',
            empty = '',
            empty_open = '',
        }
    }
end

return config
