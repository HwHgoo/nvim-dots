local config = {}

function config.rainbow()
end

function config.treesitter()
    require('nvim-treesitter.configs').setup {
        ensure_installed = {'go', 'lua', 'c'},
        highlight = {
            enable = true
        },
        
        textobjects = {
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
        },
    }
end

function config.neoscroll()
    require('neoscroll').setup()
end

function config.surround()
end

return config
