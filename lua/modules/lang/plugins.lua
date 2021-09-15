local lang = {}
local conf = require('modules.lang.config')

lang['fatih/vim-go'] = {
    opt = true,
    ft = 'go',
    config = conf.vim_go
}

return lang
