-- ~/.config/nvim/lua/utils/python.lua

local M = {}

-- 缓存 Python 路径
local cached_path = nil

function M.get_python_path(force_refresh)
  local cmd = 'python -c "import sys; print(sys.executable)"'
  local handle = io.popen(cmd .. " 2>&1")
        
  if handle then
    local output = handle:read("*a")
    
    handle:close()
            
    -- 清理输出
    output = output:gsub("%s+$", "")

    return output
  end 
end

function M.setup()
    local python_path = M.get_python_path()
    
    if python_path then
        -- 设置 Neovim 的 Python 主机
        print(python_path)
        vim.g.python3_host_prog = python_path
    end
end

-- 导出函数供外部使用
function M.get_host_prog()
    return vim.g.python3_host_prog
end

return M

