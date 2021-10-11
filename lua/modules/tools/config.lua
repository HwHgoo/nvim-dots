local config = {}

function config.telescope()
    if not packer_plugins['plenary.nvim'].loaded then
        vim.cmd [[packadd plenary.nvim]]
    end

    if not packer_plugins['popup.nvim'].loaded then
        vim.cmd [[packadd popup.nvim]]
    end

    if not packer_plugins['telescope-project.nvim'].loaded then
        vim.cmd [[packadd telescope-project.nvim]]
    end

    require('telescope').setup {
        defaults = {
            selection_caret = ' ',
            prompt_prefix = ' ',
            devicons = true
        }
    }

    require('telescope').load_extension('project')

end


return config
