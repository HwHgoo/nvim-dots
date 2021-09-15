local ui = {}
local conf = require('modules.ui.config')

ui['morhetz/gruvbox'] = {
    opt = true
}

ui['kyazdani42/nvim-web-devicons'] = {}

--ui['lewis6991/gitsigns.nvim'] = {
--    opt = true,
--    event = {'BufRead', 'BufNewFile'},
--    config = conf.gitsigns,
--    requires = {
--        {'nvim-lua/plenary.nvim', opt = true}
--    }
--}

ui['kyazdani42/nvim-tree.lua'] = {
    opt = true,
    cmd = {'NvimTreeToggle'},
    config = conf.nvim_tree
}

ui['connorholyday/vim-snazzy'] = {
    opt = true,
}

return ui
