return {
  -- Mason 包管理器
  --[[
  {
    "williamboman/mason.nvim",
    init = function()
      -- 在插件加载前拦截系统调用
      local original_executable = vim.fn.executable
      vim.fn.executable = function(cmd)
        -- mason 检查的这些命令，直接返回存在
        local mason_checks = {
          "ruby", "gem", "composer", "php", "npm",
          "node", "javac", "java", "julia"
        }
        
        for _, check in ipairs(mason_checks) do
          if cmd == check then
            return 1 -- 返回 "存在"
          end
        end
        
        -- 其他命令使用原始检查
        return original_executable(cmd)
      end
    end,
    config = function()
      require("mason").setup({
        ui = {
          check_outdated_packages_on_open = false,
        },
      })
    end,
  },

  -- Mason 与 LSP 配置的桥梁
  {
    "williamboman/mason-lspconfig.nvim",
    config = true, -- 使用完全默认配置
  },
  --]] 
  -- 自动补全引擎
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",      -- LSP 补全源
      "hrsh7th/cmp-buffer",        -- 缓冲区补全源
      "hrsh7th/cmp-path",          -- 路径补全源
      "hrsh7th/cmp-cmdline",       -- 命令行补全源
      --"L3MON4D3/LuaSnip",          -- 代码片段引擎
      "saadparwaiz1/cmp_luasnip",  -- 代码片段补全源
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({}) -- 使用完全默认配置
    end,
  },
}

