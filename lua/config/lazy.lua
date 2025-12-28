-- 首先应用基础设置
require("config.basic").setup()
require("config.keymaps").setup()

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazyrepo = "https://github.com/folke/lazy.nvim.git"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  print("正在安装 lazy.nvim...")
  local out = vim.fn.system({ "git", "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
  print("lazy.nvim 安装完成！")
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- install = { colorscheme = { "dracula" }},
  checker = { enabled = true },
  {
     "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      if pcall(require, "nvim-treesitter.configs") then
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "python", "lua", "vim" },
          auto_install = true,
          highlight = { enable = true },
        })
        print("nvim-treesitter 配置成功!")
      else
        vim.notify("请运行 :Lazy sync 安装插件", vim.log.levels.WARN)
      end
    end
  }
})
