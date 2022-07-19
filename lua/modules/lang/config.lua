local config = {}

function config.vim_go()
    local g = vim.g
    g.go_doc_keywordprg_enabled = 0
    g.go_highlight_types = 1
    g.go_highlight_fields = 1
    g.go_highlight_functions = 1
    g.go_highlight_function_calls = 1
    g.go_highlight_operators = 1
    g.go_highlight_extra_types = 1
    g.go_fmt_command = "goimports"
end

function config.nvim_go()
    require('go').setup()
end

return config
