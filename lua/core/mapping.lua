local bind = require('keymap.bind')
local map_cmd = bind.map_cmd
local map_cr = bind.map_cr
local ac = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup
local getCursor = vim.api.nvim_win_get_cursor

local mapping = {
    -- normal mode
    ['n|S'] = map_cr('w'):with_noremap(),
    ['n|Q'] = map_cr('q'):with_noremap(),
    ['n|F'] = map_cr('noh'):with_noremap(),
    ['n|sl'] = map_cmd(':set splitright<CR>:vs<CR>'):with_noremap(),
    ['n|<LEFT>'] = map_cr(':vertical resize +2'):with_noremap(),
    ['n|<RIGHT>'] = map_cr(':vertical resize -2'):with_noremap(),
    ['n|<leader>l'] = map_cmd('<C-w>l'):with_noremap(),
    ['n|<leader>h'] = map_cmd('<C-w>h'):with_noremap(),
    ['n|<leader>j'] = map_cmd('<C-w>j'):with_noremap(),
    ['n|<leader>k'] = map_cmd('<C-w>k'):with_noremap(),
    ['n|<leader>H'] = map_cmd('<C-w>H'):with_noremap(),
    ['n|<leader>L'] = map_cmd('<C-w>L'):with_noremap(),

    -- insert mode
    ['i|jj'] = map_cmd('<RIGHT>'):with_noremap(),
    ['i|hh'] = map_cmd('<LEFT>'):with_noremap(),
    ['i|;;'] = map_cmd('<ESC>A'):with_noremap(),

    -- visual mode
    ['x|v'] = map_cmd('<ESC>^vg_'):with_noremap(),
}


bind.load_map(mapping)

local function center(insertMode)
    local pos = vim.fn.getcurpos()
    local line = pos[2]
    local col = pos[3]

    if line ~= vim.b.last_line then
        vim.cmd [[norm! zz]]
        vim.b.last_line = line

        if insertMode then
            vim.fn.cursor(line, col)
        end
    end
end

local group = ag('center', {clear = true})
ac('CursorMoved', {
    group = group,
    callback = function ()
        center(false)
    end
})

ac('CursorMovedI', {
    group = group,
    callback = function ()
        center(true)
    end
})

