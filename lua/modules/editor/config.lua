local config = {}

function config.rainbow()
end

function config.treesitter()
    vim.cmd('syntax on')
    require('nvim-treesitter.configs').setup {
        ensure_installed = {'go', 'lua', 'c'},
        highlight = {
            enable = true
        },
        textobjects = {
            enable = true,
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                    ["ao"] = "@condition.outer",
                    ["io"] = "@condition.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                }
            },
            move = {
                enable = true,
                keymaps = {
                    ["]m"] = "@function.outer",
                }
            }
        },
    }
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

return config
