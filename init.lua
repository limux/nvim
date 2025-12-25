-- ~/.config/nvim/init.lua

-- 禁用不需要的 providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_nvim_treesitter = 1
vim.g.did_load_filetypes = 1
vim.g.do_filetype_lua = 0

-- 设置 Neovim 专用 Python 环境
vim.g.python3_host_prog = vim.fn.expand('~/heoxsoft/nvim-venv/bin/python')

vim.g.loaded_luasnip = 1

-- 基础设置模块
require('config.options')

require("config.basic")

-- 键位映射模块
require("config.keymaps")

-- 插件管理器
require("config.lazy")

