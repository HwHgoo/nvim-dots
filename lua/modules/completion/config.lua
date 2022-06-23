local config = {}

function config.autopairs()
    require('nvim-autopairs').setup{}
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done( { map_char = { tex = '' } }) )
end

function config.lspconfig()
    if not packer_plugins['nvim-lspconfig'].loaded then
        vim.cmd [[packadd nvim-lspconfig]]
    end
    if not packer_plugins['nvim-lsp-installer'].loaded then
        vim.cmd [[packadd nvim-lsp-installer]]
    end

    local nvim_lsp = require('lspconfig')
    local lsp_installer = require('nvim-lsp-installer')
    lsp_installer.setup()

    local lspconf = require('modules.completion.lspconf')
    local servers = {
        'sumneko_lua',
        'gopls',
        'clangd',
        'cmake'
    }
    local root_pattern = require('lspconfig/util').root_pattern
    for _, server in ipairs(servers) do
        if lspconf[server] ~= nil then
            nvim_lsp[server].setup {
                cmd = lspconf[server]['cmd'],
                filetyps = lspconf[server]['filetyps'],
                root_dir = root_pattern(lspconf[server]['root_dir'])
            }
        else
            nvim_lsp[server].setup{}
        end
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
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,

            ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
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
