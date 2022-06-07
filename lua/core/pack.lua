local fn = vim.fn
local modules_dir = fn.stdpath('config')..'/lua/modules'
local packer = nil
local Packer = {}
local data_dir = string.format('%s/site/', vim.fn.stdpath('data'))
Packer.__index = Packer

function Packer:load_plugins()
    self.repos = {}

    local get_plugins_file = function()
        local list = {}
        local path = vim.split(fn.globpath(modules_dir, '*/plugins.lua'), '\n')
        for _, p in pairs(path) do
            list[#list + 1] = p:sub(#modules_dir - 6, -1)
        end
        return list
    end

    local plugins_file = get_plugins_file()
    for _, pf in ipairs(plugins_file) do
        local repos = require(pf:sub(0, #pf - 4))
        for repo, conf in pairs(repos) do
            self.repos[#self.repos + 1] = vim.tbl_extend('force', {repo}, conf)
        end
    end

end

function Packer:load_packer()
    if packer == nil then
        vim.api.nvim_command('packadd packer.nvim')
        packer = require('packer')
    else
        return
    end
    packer.init({
        git = {
            default_url_format = 'https://github.com/%s'
        }
    })
    local use = packer.use
    packer.reset()
    use {
        'wbthomason/packer.nvim'
    }
    self:load_plugins()
    for _, repo in ipairs(self.repos) do
        use(repo)
    end
end

function Packer:ensure_packer()
    local packer_path = data_dir..'pack/packer/start/packer.nvim'
    local state = vim.loop.fs_stat(packer_path)
    if not state then
        local cmd = '!git clone https://github.com/wbthomason/packer.nvim '..packer_path
        vim.api.nvim_command(cmd)
        self:load_packer()
        packer.install()
    end
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        Packer:load_packer()
        return packer[key]
    end
})

function plugins.ensure_packer()
    Packer:ensure_packer()
end

function plugins.magic_compile()
    plugins.compile()
    --os.remove('~/.config/nvim/plugin/packer_compiled.lua')
    --vim.api.nvim_command(':bufdo e')
end

function plugins.load_compile()
    vim.cmd [[command! PackerCompile lua require('core.pack').magic_compile()]]
    vim.cmd [[command! PackerInstall lua require('core.pack').install()]]
    vim.cmd [[command! PackerClean lua require('core.pack').clean()]]
    vim.cmd [[command! PackerUpdate lua require('core.pack').update()]]
    vim.cmd [[command! PackerSync lua require('core.pack').sync()]]
    vim.cmd [[autocmd User PackerComplete lua require('core.pack').magic_compile()]]
    vim.cmd [[command! PackerStatus lua require('core.pack').status()]]
end

return plugins
