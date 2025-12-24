return {
  -- Mason 包管理器
  {
    "williamboman/mason.nvim",
    config = true, -- 使用完全默认配置
  },
  
  -- Mason 与 LSP 配置的桥梁
  {
    "williamboman/mason-lspconfig.nvim",
    config = true, -- 使用完全默认配置
  },
  
  -- 自动补全引擎
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",      -- LSP 补全源
      "hrsh7th/cmp-buffer",        -- 缓冲区补全源
      "hrsh7th/cmp-path",          -- 路径补全源
      "hrsh7th/cmp-cmdline",       -- 命令行补全源
      "L3MON4D3/LuaSnip",          -- 代码片段引擎
      "saadparwaiz1/cmp_luasnip",  -- 代码片段补全源
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({}) -- 使用完全默认配置
    end,
  },
}

