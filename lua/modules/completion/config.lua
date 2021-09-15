local config = {}

function config.autopairs()
    require('nvim-autopairs').setup{}
    require('nvim-autopairs.completion.cmp').setup {
        map_cr = true,
        map_complete = true,
        auto_select = true
    }
end

function config.lspconfig()
    if not packer_plugins['nvim-lspconfig'].loaded then
        vim.cmd [[packadd nvim-lspconfig]]
    end
    if not packer_plugins['nvim-lspinstall'].loaded then
        vim.cmd [[packadd nvim-lspinstall]]
    end

    local nvim_lsp = require('lspconfig')
    local lsp_install = require('lspinstall')
    lsp_install.setup()

    local servers = lsp_install.installed_servers()
    for _, server in pairs(servers) do
        if server == 'go' then
            server = 'gopls'
        end
        nvim_lsp[server].setup{}
    end
end

function config.cmp()
    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end
    local cmp = require('cmp')
    cmp.setup {
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        },

        mapping = {
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Repalce,
                select = true,
            }),
            ['<Tab>'] = function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(t('<C-n>'), 'n')
                else
                    fallback()
                end
            end,

            ['<S-Tab>'] = function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(t('<C-p>'), 'n')
                else
                    fallback()
                end
            end,

            ['<C-h>'] = function(fallback)
                if require('luasnip').jumpable(-1) then
                    vim.fn.feedkeys(t('<Plug>luasnip-jump-prev'))
                else
                    fallback()
                end
            end,

            ['<C-l>'] = function (fallback)
                if require('luasnip').jumpable(-1) then
                    vim.fn.feedkeys(t('<Plug>luasnip-jump-next'))
                else
                    fallback()
                end
            end
        },
        sources = {
            {name = 'nvim_lsp'}, {name = 'nvim_lua'}, {name = 'luasnip'},
            {name = 'buffer'}, {name = 'path'}, {name = 'spell'}
        }
    }
end

function config.luasnip()
    require('luasnip').config.set_config {
        history = true,
        updateevents = 'TextChanged, TextChangedI'
    }

    require('luasnip/loaders/from_vscode').load()
end

function config.lspsaga()
    vim.api.nvim_command('autocmd CursorHold * Lspsaga show_line_diagnostics')
end

return config
