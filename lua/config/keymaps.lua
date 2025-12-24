-- 键位映射设置
local M = {}

function M.setup()
  local opts = { noremap = true, silent = true }
  
  -- 常用操作
  -- 保存文件
  vim.keymap.set("n", "<leader>w", ":w<CR>", opts)
  
  -- 退出
  vim.keymap.set("n", "<leader>q", ":q<CR>", opts)
  
  -- 保存并退出
  vim.keymap.set("n", "<leader>x", ":wq<CR>", opts)
  
  -- 强制退出
  vim.keymap.set("n", "<leader>Q", ":q!<CR>", opts)
  
  -- 窗口管理
  -- 分割窗口
  vim.keymap.set("n", "<leader>sv", "<C-w>v", opts)  -- 垂直分割
  vim.keymap.set("n", "<leader>sh", "<C-w>s", opts)  -- 水平分割
  
  -- 窗口导航
  vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
  vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
  vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
  vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
  
  -- 调整窗口大小
  vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
  vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
  vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
  vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)
  
  -- 标签页管理
  vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)     -- 新建标签页
  vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts)   -- 关闭标签页
  vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts)       -- 下一个标签页
  vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts)       -- 上一个标签页
  
  -- 缓冲区管理
  vim.keymap.set("n", "<leader>bn", ":bnext<CR>", opts)      -- 下一个缓冲区
  vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", opts)  -- 上一个缓冲区
  vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", opts)    -- 删除缓冲区
  
  -- 编辑相关
  -- 全选
  vim.keymap.set("n", "<leader>a", "ggVG", opts)
  
  -- 复制到系统剪贴板
  vim.keymap.set("v", "<leader>y", '"+y', opts)
  vim.keymap.set("n", "<leader>Y", '"+yg_', opts)
  vim.keymap.set("n", "<leader>yy", '"+yy', opts)
  
  -- 从系统剪贴板粘贴
  vim.keymap.set("n", "<leader>p", '"+p', opts)
  vim.keymap.set("n", "<leader>P", '"+P', opts)
  vim.keymap.set("v", "<leader>p", '"+p', opts)
  vim.keymap.set("v", "<leader>P", '"+P', opts)
  
  -- 取消高亮搜索
  vim.keymap.set("n", "<leader>nh", ":nohl<CR>", opts)
  
  -- 快速移动
  -- 移动到行首/行尾
  vim.keymap.set({ "n", "v" }, "H", "^", opts)
  vim.keymap.set({ "n", "v" }, "L", "$", opts)
  
  -- 半页滚动
  vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
  vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
  
  -- 搜索时保持光标居中
  vim.keymap.set("n", "n", "nzzzv", opts)
  vim.keymap.set("n", "N", "Nzzzv", opts)
  
  -- 插件相关快捷键占位符
  -- 这些可以在插件配置文件中覆盖
  
  -- 文件树（如果安装了 nvim-tree）
  -- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
  
  -- 文件搜索（如果安装了 telescope）
  -- vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", opts)
  -- vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
  -- vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts)
  -- vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
  
  -- LSP 相关（配置 LSP 时添加）
  -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  
  -- 插入模式快捷键
  -- 快速退出插入模式
  vim.keymap.set("i", "jj", "<ESC>", opts)
  
  -- 快速移动
  vim.keymap.set("i", "<C-h>", "<Left>", opts)
  vim.keymap.set("i", "<C-j>", "<Down>", opts)
  vim.keymap.set("i", "<C-k>", "<Up>", opts)
  vim.keymap.set("i", "<C-l>", "<Right>", opts)
  
  -- 命令模式快捷键
  vim.keymap.set("c", "<C-h>", "<Left>", opts)
  vim.keymap.set("c", "<C-j>", "<Down>", opts)
  vim.keymap.set("c", "<C-k>", "<Up>", opts)
  vim.keymap.set("c", "<C-l>", "<Right>", opts)
  vim.keymap.set("c", "<C-a>", "<Home>", opts)
  vim.keymap.set("c", "<C-e>", "<End>", opts)
end

return M

