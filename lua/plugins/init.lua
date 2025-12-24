-- gruvbox 颜色主题
-- 必须 return 一个列表！
return {
  { import = "plugins.ui" },
  -- 可以继续导入其他分类
  -- { import = "plugins.tools" },
  -- { import = "plugins.lsp" },
  { import = "plugins.startify" },

  {
    "ellisonleao/gruvbox.nvim",     -- 插件仓库地址
    priority = 1000,                -- 高优先级，先加载
    config = function()             -- 插件加载后的配置函数
      -- 设置颜色主题
      -- vim.cmd.colorscheme("gruvbox")
    end,
  }
}
