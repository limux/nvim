-- 极简 LSP 配置
vim.lsp.config({
  servers = {
    -- Lua
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    },
    
    -- Zig (需要安装 zls)
    zls = {},
    
    -- Python (三个流行服务器，选一个即可)
    pyright = {},        -- Microsoft出品，类型检查强
    -- pylsp = {},       -- 通用Python语言服务器
    -- jedi_language_server = {}, -- Jedi引擎
    
    -- 可选：其他常用服务器
    -- clangd = {},      -- C/C++
    -- rust_analyzer = {}, -- Rust
    -- tsserver = {},    -- TypeScript/JavaScript
    -- gopls = {},       -- Go
    -- bashls = {},      -- Bash
  }
})

-- 可选：基本快捷键映射
local opts = { noremap = true, silent = true }

-- 查看文档
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
-- 跳转到定义
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- 显示代码操作
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
-- 重命名符号
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
-- 格式化代码
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format({ async = true })
end, opts)
