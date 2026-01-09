return {
  -- 可以继续导入其他分类
  -- { import = "plugins.lsp" },
  { import = "plugins.lualine" },
  { import = "plugins.dracula" },
  { import = "plugins.startify" },
  { import = "plugins.treesitter" },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = { "lua", "vim", "vimdoc" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
