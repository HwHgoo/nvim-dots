local comp = {}
local conf = require('modules.completion.config')

comp['windwp/nvim-autopairs'] = {
    after = 'nvim-cmp',
    config = conf.autopairs
}

comp['neovim/nvim-lspconfig'] = {
    opt = true,
    event = {'BufReadPre', 'BufNewFile'},
    config = conf.lspconfig
}

comp['williamboman/nvim-lsp-installer'] = {
    opt = true,
    after = 'nvim-lspconfig'
}

comp['glepnir/lspsaga.nvim'] = {
    opt = true,
    after = 'nvim-lspconfig',
    config = conf.lspsaga
}

comp['ray-x/lsp_signature.nvim'] = {
    opt = true,
    after = 'nvim-lspconfig'
}

comp['hrsh7th/nvim-cmp'] = {
    event = 'InsertEnter',
    config = conf.cmp,
    requires = {
        {'saadparwaiz1/cmp_luasnip', after = 'LuaSnip'},
        {'hrsh7th/cmp-buffer', after = 'cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp', after = 'cmp-buffer'},
        {'hrsh7th/cmp-nvim-lua', after = 'cmp-nvim-lsp'},
        {'hrsh7th/cmp-path', after = 'cmp-nvim-lua'},
        {'f3fora/cmp-spell', after = 'cmp-path'},
    }
}

comp['L3MON4D3/LuaSnip'] = {
    after = 'nvim-cmp',
    config = conf.luasnip,
    requires = 'rafamadriz/friendly-snippets'
}


return comp
