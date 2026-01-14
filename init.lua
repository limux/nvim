-- ~/.config/nvim/init.lua
-- vim.g.loaded_luasnip = 1

-- 导入模块
local python_config = require("utils.python")

-- 自动设置 Python 路径
python_config.setup()

-- 基础设置模块
require("config.basic").setup()

-- 键位映射模块
require("config.keymaps").setup()

-- 插件管理器
require("config.lazy")

