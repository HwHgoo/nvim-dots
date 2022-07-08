local lspconf = {}

local cmd = 'cmd'
local filetyps = 'filetyps'
local root = 'root_dir'
local single = 'single_file_support'

lspconf['clangd'] = {
    [cmd] = {
        'clangd',
        '--background-index',
        '-j=12',
        '--clang-tidy',
        '--clang-tidy-checks=performance-*,bugprone-*',
        '--query-driver=/usr/bin/g++',
        '--all-scopes-completion',
        '--header-insertion=iwyu',
        '--pch-storage=memory'
    },

    [filetyps] = {
        'c', 'cc', 'cpp', 'h', 'hpp'
    },

    [root] = {
        '.git',
        '.root',
        '.vscode',
        '.clang-format'
    },

    [single] = true,
}

lspconf['cmake'] = {
    [cmd] = {
        'cmake-language-server'
    },
    [filetyps] = {
        'cmake'
    },
    [root] = {
        '.git',
        '.root',
        '.clang-format',
        'build/'
    },
    [single] = true
}

return lspconf
