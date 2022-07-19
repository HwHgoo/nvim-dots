local config = {}

function config.rainbow()
end

function config.treesitter()
    require('nvim-treesitter.configs').setup {
        ensure_installed = {'go', 'lua', 'c'},
        highlight = {
            enable = true
        },
    }

    vim.cmd [[syntax on]]
end

function config.neoscroll()
    require('neoscroll').setup()
end

function config.surround()
end

function config.comment()
    require('Comment').setup()
    vim.cmd [[command! CommentLineToggle lua require('Comment.api').toggle_current_linewise()]]
    vim.cmd [[command! CommentBlockToggle lua require('Comment.api').toggle_current_blockwise()]]
end

function config.formatter()
    local sl = require('formatter.filetypes.lua').stylua
    require('formatter').setup{
        filetype = {
            lua = {
                sl
            }
        }
    }
end

function config.center()
    require('stay-centered')
end

function config.hop()
    require('hop').setup()
end

return config
