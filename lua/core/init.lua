local map_leader = function()
    vim.g.mapleader = ' '
end
local load_core =  function()
    map_leader()
	require('core.options')
    require('core.mapping')
    local pack = require('core.pack')
    pack.load_compile()
    vim.cmd [[colorscheme gruvbox]]
    require('keymap')
end
load_core()
