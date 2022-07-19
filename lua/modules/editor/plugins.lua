local editor = {}
local conf = require('modules.editor.config')

editor['nvim-treesitter/nvim-treesitter'] = {
    opt = true,
    -- run = ':TSUpdate',
    event = 'BufReadPre',
    config = conf.treesitter
}

editor['JoosepAlviste/nvim-ts-context-commentstring'] = {
    opt = true,
    after = 'nvim-treesitter'
}

editor['nvim-treesitter/nvim-treesitter-textobjects'] = {
    opt = true,
    after = 'nvim-treesitter'
}

editor['karb94/neoscroll.nvim'] = {
    opt = false,
     config = conf.neoscroll,
}

editor['tpope/vim-surround'] = {
    opt = true,
    event = 'BufRead',
    config = conf.surround,
}

editor['numToStr/Comment.nvim'] = {
    opt = true,
    event = 'BufRead',
    config = conf.comment
}

editor['mhartington/formatter.nvim'] = {
    opt = true,
    event = 'BufRead',
    config = conf.formatter
}

editor['phaazon/hop.nvim'] = {
    opt = false,
    config = conf.hop,
}

return editor
