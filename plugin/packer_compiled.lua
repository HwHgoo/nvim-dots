-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/huwenhao/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/huwenhao/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/huwenhao/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/huwenhao/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/huwenhao/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    after = { "cmp_luasnip" },
    config = { "\27LJ\1\2±\1\0\0\2\0\a\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0007\0\3\0003\1\4\0>\0\2\0014\0\0\0%\1\5\0>\0\2\0027\0\6\0>\0\1\1G\0\1\0\tload luasnip/loaders/from_vscode\1\0\2\fhistory\2\17updateevents\30TextChanged, TextChangedI\15set_config\vconfig\fluasnip\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/LuaSnip"
  },
  ["cmp-buffer"] = {
    after = { "cmp-nvim-lsp" },
    after_files = { "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      cmp_luasnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after = { "cmp-nvim-lua" },
    after_files = { "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after = { "cmp-path" },
    after_files = { "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after = { "cmp-spell" },
    after_files = { "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["cmp-nvim-lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  ["cmp-spell"] = {
    after_files = { "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/cmp-spell/after/plugin/cmp-spell.lua" },
    load_after = {
      ["cmp-path"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/cmp-spell"
  },
  cmp_luasnip = {
    after = { "cmp-buffer" },
    after_files = { "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      LuaSnip = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  gruvbox = {
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/gruvbox"
  },
  ["lsp_signature.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\1\2g\0\0\2\0\4\0\0064\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\1G\0\1\0007autocmd CursorHold * Lspsaga show_line_diagnostics\17nvim_command\bapi\bvim\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { '\27LJ\1\2œ\1\0\0\2\0\5\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\0014\0\0\0%\1\3\0>\0\2\0027\0\2\0003\1\4\0>\0\2\1G\0\1\0\1\0\3\17map_complete\2\16auto_select\2\vmap_cr\2"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0' },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs", "LuaSnip" },
    config = { "\27LJ\1\2F\0\1\6\0\3\0\b4\1\0\0007\1\1\0017\1\2\1\16\2\0\0)\3\2\0)\4\2\0)\5\2\0@\1\5\0\27nvim_replace_termcodes\bapi\bvimC\0\1\3\0\4\0\a4\1\0\0%\2\1\0>\1\2\0027\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\15lsp_expand\fluasnip\frequireu\0\1\4\1\6\1\0184\1\0\0007\1\1\0017\1\2\1>\1\1\2\t\1\0\0T\1\t€4\1\0\0007\1\1\0017\1\3\1+\2\0\0%\3\4\0>\2\2\2%\3\5\0>\1\3\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\6n\n<C-n>\rfeedkeys\15pumvisible\afn\bvim\2u\0\1\4\1\6\1\0184\1\0\0007\1\1\0017\1\2\1>\1\1\2\t\1\0\0T\1\t€4\1\0\0007\1\1\0017\1\3\1+\2\0\0%\3\4\0>\2\2\2%\3\5\0>\1\3\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\6n\n<C-p>\rfeedkeys\15pumvisible\afn\bvim\2–\1\0\1\4\1\a\0\0194\1\0\0%\2\1\0>\1\2\0027\1\2\1'\2ÿÿ>\1\2\2\15\0\1\0T\2\b€4\1\3\0007\1\4\0017\1\5\1+\2\0\0%\3\6\0>\2\2\0=\1\0\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\28<Plug>luasnip-jump-prev\rfeedkeys\afn\bvim\rjumpable\fluasnip\frequire–\1\0\1\4\1\a\0\0194\1\0\0%\2\1\0>\1\2\0027\1\2\1'\2ÿÿ>\1\2\2\15\0\1\0T\2\b€4\1\3\0007\1\4\0017\1\5\1+\2\0\0%\3\6\0>\2\2\0=\1\0\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\28<Plug>luasnip-jump-next\rfeedkeys\afn\bvim\rjumpable\fluasnip\frequire¸\4\1\0\b\0'\0?1\0\0\0004\1\1\0%\2\2\0>\1\2\0027\2\3\0013\3\a\0003\4\5\0001\5\4\0:\5\6\4:\4\b\0033\4\v\0007\5\t\0017\5\n\5>\5\1\2:\5\f\0047\5\t\0017\5\r\5>\5\1\2:\5\14\0047\5\t\0017\5\15\5'\6üÿ>\5\2\2:\5\16\0047\5\t\0017\5\15\5'\6\4\0>\5\2\2:\5\17\0047\5\t\0017\5\18\0053\6\21\0007\a\19\0017\a\20\a:\a\22\6>\5\2\2:\5\23\0041\5\24\0:\5\25\0041\5\26\0:\5\27\0041\5\28\0:\5\29\0041\5\30\0:\5\31\4:\4\t\0032\4\a\0003\5 \0;\5\1\0043\5!\0;\5\2\0043\5\"\0;\5\3\0043\5#\0;\5\4\0043\5$\0;\5\5\0043\5%\0;\5\6\4:\4&\3>\2\2\0010\0\0€G\0\1\0\fsources\1\0\1\tname\nspell\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\n<C-l>\0\n<C-h>\0\f<S-Tab>\0\n<Tab>\0\t<CR>\rbehavior\1\0\1\vselect\2\fRepalce\20ConfirmBehavior\fconfirm\n<C-f>\n<C-d>\16scroll_docs\n<C-p>\21select_prev_item\n<C-n>\1\0\0\21select_next_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_signature.nvim", "lspsaga.nvim", "nvim-lspinstall" },
    config = { "\27LJ\1\2ß\2\0\0\n\0\16\0*4\0\0\0007\0\1\0007\0\2\0\14\0\0\0T\0\4€4\0\3\0007\0\4\0%\1\5\0>\0\2\0014\0\0\0007\0\6\0007\0\2\0\14\0\0\0T\0\4€4\0\3\0007\0\4\0%\1\a\0>\0\2\0014\0\b\0%\1\t\0>\0\2\0024\1\b\0%\2\n\0>\1\2\0027\2\v\1>\2\1\0017\2\f\1>\2\1\0024\3\r\0\16\4\2\0>\3\2\4D\6\a€\a\a\14\0T\b\1€%\a\15\0006\b\a\0007\b\v\b2\t\0\0>\b\2\1B\6\3\3N\6÷G\0\1\0\ngopls\ago\npairs\22installed_servers\nsetup\15lspinstall\14lspconfig\frequire\28packadd nvim-lspinstall\20nvim-lspinstall\27packadd nvim-lspconfig\bcmd\bvim\vloaded\19nvim-lspconfig\19packer_plugins\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\1\2Ö\3\0\0\3\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\0014\0\4\0007\0\5\0003\1\a\0003\2\b\0:\2\t\0013\2\n\0:\2\v\1:\1\6\0G\0\1\0\vfolder\1\0\6\topen\bî—¾\15empty_open\bï„•\nempty\bï„”\15arrow_open\bï‘¼\16arrow_close\bï‘ \fdefault\bî—¿\bgit\1\0\a\runstaged\bï™•\fdeleted\bï‘˜\14untracked\tâ˜… \fignored\tâ—Œ \runmerged\bîœ§\frenamed\bïƒ¬\vstaged\bâœ“\1\0\2\fdefault\bî˜’\fsymlink\bï’\20nvim_tree_icons\6g\bvim\1\0\t\18disable_netrw\3\1\rtab_open\3\1\vfollow\3\1\15auto_close\3\1\17hijack_netrw\3\1\20lsp_diagnostics\3\1\18hide_dotfiles\3\0\27highlight_opened_files\3\1\23follow_update_path\3\1\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects", "nvim-ts-context-commentstring" },
    config = { "\27LJ\1\2ÿ\2\0\0\5\0\14\0\0174\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\0013\2\v\0003\3\b\0003\4\t\0:\4\n\3:\3\f\2:\2\r\1>\0\2\1G\0\1\0\16textobjects\vselect\1\0\0\fkeymaps\1\0\n\aaf\20@function.outer\aac\17@class.outer\aib\17@block.inner\aal\16@loop.outer\ail\16@loop.inner\aif\20@function.inner\aio\21@condition.inner\aab\17@block.outer\aic\17@class.inner\aao\21@condition.outer\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\4\0\0\ago\blua\6c\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["telescope-project.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-project.nvim", "popup.nvim", "plenary.nvim" },
    commands = { "Telescope" },
    config = { "\27LJ\1\2³\3\0\0\3\0\18\0*4\0\0\0007\0\1\0007\0\2\0\14\0\0\0T\0\4€4\0\3\0007\0\4\0%\1\5\0>\0\2\0014\0\0\0007\0\6\0007\0\2\0\14\0\0\0T\0\4€4\0\3\0007\0\4\0%\1\a\0>\0\2\0014\0\0\0007\0\b\0007\0\2\0\14\0\0\0T\0\4€4\0\3\0007\0\4\0%\1\t\0>\0\2\0014\0\n\0%\1\v\0>\0\2\0027\0\f\0003\1\14\0003\2\r\0:\2\15\1>\0\2\0014\0\n\0%\1\v\0>\0\2\0027\0\16\0%\1\17\0>\0\2\1G\0\1\0\fproject\19load_extension\rdefaults\1\0\0\1\0\3\rdevicons\2\18prompt_prefix\tï‘« \20selection_caret\tï¡ \nsetup\14telescope\frequire#packadd telescope-project.nvim\27telescope-project.nvim\23packadd popup.nvim\15popup.nvim\25packadd plenary.nvim\bcmd\bvim\vloaded\17plenary.nvim\19packer_plugins\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-go"] = {
    config = { "\27LJ\1\2–\2\0\0\2\0\v\0\0194\0\0\0007\0\1\0'\1\0\0:\1\2\0'\1\1\0:\1\3\0'\1\1\0:\1\4\0'\1\1\0:\1\5\0'\1\1\0:\1\6\0'\1\1\0:\1\a\0'\1\1\0:\1\b\0%\1\n\0:\1\t\0G\0\1\0\14goimports\19go_fmt_command\29go_highlight_extra_types\27go_highlight_operators go_highlight_function_calls\27go_highlight_functions\24go_highlight_fields\23go_highlight_types\30go_doc_keywordprg_enabled\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/vim-go"
  },
  ["vim-snazzy"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/vim-snazzy"
  },
  ["vim-surround"] = {
    config = { "\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/huwenhao/.local/share/nvim/site/pack/packer/opt/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-lspconfig'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'nvim-lspconfig'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'vim-surround', 'nvim-treesitter'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/huwenhao/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /home/huwenhao/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /home/huwenhao/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
