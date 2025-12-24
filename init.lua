-- 禁用不需要的 providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- 基础设置模块
require("config.basic")

-- 键位映射模块
require("config.keymaps")

-- 插件管理器
require("config.lazy")
