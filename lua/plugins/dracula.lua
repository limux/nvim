-- ~/.config/nvim/lua/plugins/dracula.lua
-- Dracula, gruvbox 主题配置
-- 必须 return 一个列表！

return {
  {
    "ellisonleao/gruvbox.nvim",     -- 插件仓库地址
    priority = 1000,                -- 高优先级，先加载
    config = function()             -- 插件加载后的配置函数
      -- 只有一行：设置颜色主题
      -- vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    config = function()
      -- 所有可用选项
      vim.g.dracula_italic = 1           -- 斜体文本
      vim.g.dracula_bold = 1             -- 粗体文本
      vim.g.dracula_underline = 1        -- 下划线
      vim.g.dracula_undercurl = 1        -- 下划曲线
      vim.g.dracula_inverse = 1          -- 反转颜色
      vim.g.dracula_colorterm = 1        -- 终端颜色支持
      vim.g.dracula_italic_comment = 1   -- 注释斜体
      vim.g.dracula_full_special_attrs_support = 1  -- 完整特殊属性支持
      
      -- 应用主题
      vim.cmd.colorscheme("dracula")
    end,
  }
}

