local config = {}

function config.gitsigns()
    if not packer_plugins['plenary.nvim'].loaded then
        vim.cmd [[packadd plenary.nvim]]
    end

    require("gitsigns").setup {}
end

function config.nvim_tree()
    local g = vim.g
    g.nvim_tree_auto_close = 1
    g.nvim_tree_follow = 1
    g.nvim_tree_follow_update_path = 1
    g.nvim_tree_hide_dotfiles = 0
    g.nvim_tree_highlight_opened_files = 1
    g.nvim_tree_tab_open = 1
    g.nvim_tree_lsp_diagnostics = 1
    g.nvim_tree_disable_netrw = 1
    g.nvim_tree_hijack_netrw = 1
    g.nvim_tree_icons = {
        default = '',
        symlink = '',
        git = {
            unstaged = '✗',
            staged = '✓',
            unmerged = '',
            renamed = '➜',
            untracked = '★',
            deleted = '',
            ignored = '◌'
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
