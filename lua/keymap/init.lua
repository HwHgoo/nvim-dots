local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd

local plug_map = {
    -- Telescope
    ['n|<leader>ff'] = map_cr('Telescope find_files'):with_noremap(),
    ['n|<leader>fp'] = map_cr('Telescope project'):with_noremap():with_silent(),
    ['n|<leader>fb'] = map_cr('Telescope file_browser'):with_noremap():with_silent(),

    -- lsp
    ['n|gd'] = map_cmd('<cmd>lua vim.lsp.buf.definition()<CR>'),
    ['n|gr'] = map_cmd('<cmd>lua vim.lsp.buf.references()<CR>'),
    ['n|gm'] = map_cmd('<cmd>lua vim.lsp.buf.implementation()<CR>'),
    ['n|<leader>rn'] = map_cr('Lspsaga rename'),
    ['n|<leader>nt'] = map_cr('Lspsaga open_floaterm'),
    ['t|<A-d>'] = map_cr([[<C-\><C-n>:Lspsaga close_floaterm]]):with_noremap():with_silent(),
    ['n|K'] = map_cr('Lspsaga hover_doc'):with_noremap(),
    ['n|gs'] = map_cr('Lspsaga signature_help'):with_noremap(),

    -- NvimTree
    ['n|<leader>x'] = map_cr('NvimTreeToggle'):with_noremap(),
}

bind.load_map(plug_map)
