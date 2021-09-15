local map_option = {}

function map_option:new()
    local instance = {
        cmd = '',
        options = {
            noremap = false,
            silent = false,
            expr = false,
            nowait = false
        }
    }

    setmetatable(instance, self)
    self.__index = self
    return instance
end

function map_option:map_cmd(cmd_string)
    self.cmd = cmd_string
    return self
end

function map_option:map_cr(cmd_string)
    self.cmd = (":%s<CR>"):format(cmd_string)
    return self
end

function map_option:with_noremap()
    self.options.noremap = true
    return self
end

function map_option:with_silent()
    self.options.silent = true
    return self
end

function map_option:with_expr()
    self.options.expr = true
    return self
end

function map_option:with_nowait()
    self.options.nowait = true
    return self
end

local bind = {}

function bind.map_cmd(cmd_string)
    local mo = map_option:new()
    return mo:map_cmd(cmd_string)
end

function bind.map_cr(cmd_string)
    local mo = map_option:new()
    return mo:map_cr(cmd_string)
end

function bind.load_map(mapping)
    for key, value in pairs(mapping) do
        local mode, keymap = key:match("([^|]*)|?(.*)")
        if type(value) == 'table' then
            local cmd = value.cmd
            local options = value.options
            vim.api.nvim_set_keymap(mode, keymap, cmd, options)
        end
    end
end

return bind































