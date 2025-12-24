-- Hint: use `:h <option>` to figure out the meaning if needed

vim.opt.splitbelow = true         -- 水平分割时新窗口在下更符合直觉
vim.opt.splitright = true         -- 垂直分割时新窗口在右更符合阅读习惯

-- ========== 基本编辑器设置 =====
vim.opt.termguicolors = true      -- 24位真彩色
vim.opt.number = true             -- 显示行号
vim.opt.relativenumber = true     -- 相对行号（更方便跳转）
vim.opt.cursorline = true         -- 高亮当前行
vim.opt.signcolumn = "yes"        -- 显示标记列
vim.opt.mouse = "a"               -- 启用鼠标
vim.opt.clipboard = "unnamedplus" -- 系统剪贴板

-- ========== Tab 和缩进设置 =====
vim.opt.tabstop = 2               -- Tab 显示为2个空格
vim.opt.softtabstop = 2           -- 编辑时 Tab 等于2个空格
vim.opt.shiftwidth = 2            -- 自动缩进使用2个空格
vim.opt.expandtab = true          -- Tab 转换为空格
vim.opt.autoindent = true         -- 自动缩进
vim.opt.smartindent = true        -- 智能缩进
vim.opt.breakindent = true        -- 换行时保持缩进

-- ========== 搜索设置 ===========
vim.opt.ignorecase = true         -- 搜索忽略大小写
vim.opt.smartcase = true          -- 有大写时区分大小写
vim.opt.hlsearch = true           -- 高亮搜索结果
vim.opt.incsearch = true          -- 增量搜索

-- ========== 界面设置 ===========
vim.opt.wrap = false              -- 不自动换行
vim.opt.linebreak = true          -- 在单词边界换行（当 wrap=true 时）
vim.opt.scrolloff = 8             -- 上下保留8行
vim.opt.sidescrolloff = 8         -- 左右保留8列
vim.opt.splitright = true         -- 垂直分割在右边
vim.opt.splitbelow = true         -- 水平分割在下面
vim.opt.laststatus = 2            -- 总是显示状态栏
vim.opt.showmode = false          -- 不在状态栏显示模式（很多插件会显示）

-- ========== 文件处理设置 ==========
vim.opt.swapfile = false          -- 不创建交换文件
vim.opt.backup = false            -- 不创建备份文件
vim.opt.undofile = true           -- 持久化撤销历史
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- ========== 编码设置 ==========
vim.opt.fileencoding = "utf-8"    -- 文件编码
vim.opt.encoding = "utf-8"        -- Neovim 内部编码

-- ========== 性能优化 ==========
vim.opt.lazyredraw = false        -- 不延迟重绘（现代电脑不需要）
vim.opt.updatetime = 300          -- 更新时间（ms），影响git等插件
vim.opt.timeoutlen = 500          -- 按键超时时间

