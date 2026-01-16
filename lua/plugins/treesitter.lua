return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        --install_dir = vim.fn.stdpath('data') .. '/site',
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "python", 
          "javascript", 
          "rust", 
          "zig", 
          "go"
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        indent = { enable = true },

        auto_install = true,
        sync_install = true,
      })

      --[[
      -- 可选：在后台检查并安装重要语言（更安全的方式）
      vim.defer_fn(function()
        local ok, ts_parsers = pcall(require, "nvim-treesitter.parsers")
        if ok then
          local parser_config = ts_parsers.get_parser_configs()
          
          -- 检查关键语言是否已安装
          local critical_langs = { "lua", "vim", "vimdoc", "python", "zig" }
          for _, lang in ipairs(critical_langs) do
            local has_parser = parser_config[lang] and parser_config[lang].install_info
            if has_parser then
              local install_info = parser_config[lang].install_info
              local installed = install_info and install_info.url and 
                               vim.fn.isdirectory(install_info.url) == 1
              
              if not installed then
                -- 使用 vim.cmd 安装，这是最安全的方式
                vim.cmd("silent TSInstall " .. lang)
              end
            end
          end
        end
      end, 2000) -- 延迟2秒执行，确保主要初始化完成
      ]]
    end
  }
}
