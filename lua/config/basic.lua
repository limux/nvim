-- Hint: use `:h <option>` to figure out the meaning if needed
-- 基本 Neovim 设置
local M = {}

function M.setup()
  -- 禁用不需要的 providers
  vim.g.loaded_perl_provider = 0
  vim.g.loaded_node_provider = 0
  vim.g.loaded_ruby_provider = 0

  -- 设置编码
  vim.opt.fileencoding = "utf-8"      -- 文件编码
  vim.opt.encoding = "utf-8"          -- Neovim 内部编码

  -- 界面设置
  vim.opt.number = true               -- 显示行号
  vim.opt.relativenumber = true       -- 相对行号
  vim.opt.cursorline = true           -- 高亮当前行
  vim.opt.signcolumn = "yes"          -- 显示标志列
  vim.opt.showmode = false            -- 不在状态栏显示模式（lualine会显示）
  vim.opt.linebreak = true            -- 在单词边界换行（当 wrap=true 时）
  
  -- 缩进设置
  vim.opt.tabstop = 2                 -- Tab 显示为 2 个空格
  vim.opt.shiftwidth = 2              -- 自动缩进使用 2 个空格
  vim.opt.softtabstop = 2             -- 编辑时 Tab 等于2个空格
  vim.opt.expandtab = true            -- Tab 转换为空格
  vim.opt.autoindent = true           -- 自动缩进
  vim.opt.smartindent = true          -- 智能缩进
  vim.opt.breakindent = true          -- 换行时保持缩进

  -- 搜索设置
  vim.opt.ignorecase = true           -- 忽略大小写
  vim.opt.smartcase = true            -- 智能大小写匹配
  vim.opt.hlsearch = true             -- 高亮搜索结果
  vim.opt.incsearch = true            -- 实时搜索
  
  -- 滚动设置
  vim.opt.scrolloff = 8               -- 滚动时保留 8 行上下文
  vim.opt.sidescrolloff = 8           -- 水平滚动保留 8 列
  
  -- 分屏设置
  vim.opt.splitright = true           -- 垂直分屏在右侧打开
  vim.opt.splitbelow = true           -- 水平分屏在下方打开
  
  -- 文件设置
  vim.opt.swapfile = false            -- 不创建交换文件
  vim.opt.backup = false              -- 不创建备份文件
  vim.opt.undofile = true             -- 启用持久撤销
  vim.opt.writebackup = false         -- 写入时不备份
  
  -- 剪贴板设置
  vim.opt.clipboard = "unnamedplus"   -- 使用系统剪贴板
  
  -- 其他设置
  vim.opt.mouse = "a"                 -- 启用鼠标
  vim.opt.wrap = false                -- 不自动换行
  vim.opt.termguicolors = true        -- 启用真彩色
  vim.opt.timeoutlen = 300            -- 映射等待时间（ms）
  vim.opt.updatetime = 100            -- 更新时间（影响 CursorHold 事件）
  vim.opt.completeopt = "menu,menuone,noselect" -- 补全选项
  vim.opt.lazyredraw = false        -- 不延迟重绘（现代电脑不需要）
  
  -- 折叠设置
  vim.opt.foldmethod = "indent"       -- 基于缩进折叠
  vim.opt.foldlevel = 99              -- 默认不折叠
  
  -- 命令行高度
  vim.opt.cmdheight = 1               -- 命令行高度
  
  -- 外观设置
  vim.opt.laststatus = 3              -- 全局状态栏
  vim.opt.showtabline = 2             -- 总是显示标签栏
  
  vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

  -- 不可见字符
  vim.opt.list = true                 -- 显示不可见字符
  vim.opt.listchars = {
    tab = "▸ ",
    trail = "·",
    nbsp = "␣",
    extends = "❯",
    precedes = "❮"
  }
  
  -- 主题相关设置
  vim.opt.background = "dark"         -- 深色背景（配合 gruvbox）
  
  -- 设置 leader 键（需要在使用 lazy.nvim 之前设置）
  vim.g.mapleader = " "
  vim.g.maplocalleader = "\\"
end

return M

