-- ~/.config/nvim/lua/config/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazyrepo = "https://github.com/folke/lazy.nvim.git"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    print("正在安装 lazy.nvim...")
    vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  print("lazy.nvim 安装完成！")
end

-- 添加 lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")


