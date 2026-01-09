-- ~/.config/nvim/init.lua


-- 设置 Neovim 专用 Python 环境
-- vim.g.python3_host_prog = vim.fn.expand('~/heoxsoft/nvim-venv/bin/python')

-- vim.g.loaded_luasnip = 1

-- 基础设置模块
require("config.basic")

-- 键位映射模块
require("config.keymaps")

-- 插件管理器
require("config.lazy")

