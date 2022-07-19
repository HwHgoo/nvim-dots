local cmd = vim.cmd
local function bind_option(options)
	for k, v in pairs(options) do
		if v == true or v == false then
			cmd('set '..k)
		else
			cmd('set '..k..'='..v)
		end
	end
end

local global_options = {
	smarttab = true,
	shiftround = true,
	number = true,
	relativenumber = true,
	incsearch = true,
	ignorecase = true,
	smartcase = true,
	smartindent = true,
    cursorline = true,
}

local options = {
	expandtab = true,
	tabstop = 4,
	shiftwidth = 4,
    clipboard = 'unnamedplus',
}

local load_options = function()
	for k, v in pairs(global_options) do
		vim.o[k] = v
	end
	bind_option(options)
end

load_options()
