-- ~/.config/nvim/lua/utils/python.lua

local M = {}

-- 缓存 Python 路径
local cached_path = nil

function M.get_python_path(force_refresh)
    -- 如果有缓存且不强制刷新，直接返回
    if cached_path and not force_refresh then
        return cached_path
    end
    
    -- 尝试的命令列表（按优先级排序）
    local commands = {
        "python3",
        "python",
        "python3.11",
        "python3.10",
        "python3.9",
        "python3.8"
    }
    
    for _, cmd in ipairs(commands) do
        local full_cmd = string.format('%s -c "import sys; print(sys.executable)"', cmd)
        local handle = io.popen(full_cmd .. " 2>&1")
        
        if handle then
            local output = handle:read("*a")
            handle:close()
            
            -- 清理输出
            output = output:gsub("%s+$", "")
            
            -- 验证输出
            if output and output ~= "" then
                -- 排除错误信息
                local error_patterns = {
                    "command not found",
                    "not found",
                    "不是内部或外部命令",
                    "无法将",
                    "No such file",
                    "not recognized as an internal or external command"
                }
                
                local is_error = false
                for _, pattern in ipairs(error_patterns) do
                    if output:match(pattern) then
                        is_error = true
                        break
                    end
                end
                
                -- 检查是否是有效的路径
                if not is_error then
                    -- 验证是否是文件路径
                    if output:match("^/") or  -- Unix 绝对路径
                       output:match("^[A-Za-z]:[\\/]") or  -- Windows 绝对路径
                       output:match("[\\/]") then  -- 包含路径分隔符
                        
                        -- 额外检查：是否是 Python 可执行文件
                        if output:match("python") or output:match("%.exe$") then
                            cached_path = output
                            return output
                        end
                    end
                end
            end
        end
    end
    
    return nil
end

function M.setup()
    local python_path = M.get_python_path()
    
    if python_path then
        -- 设置 Neovim 的 Python 主机
        print(python_path)
        vim.g.python3_host_prog = python_path
        
        -- 验证 Python 版本
        local version_cmd = string.format('%s -c "import sys; print(\"Python\", sys.version)"', python_path)
        local handle = io.popen(version_cmd .. " 2>&1")
        if handle then
            local version = handle:read("*a"):gsub("%s+$", "")
            handle:close()
            print(string.format("✓ Python3 host prog: %s", python_path))
            print(string.format("  Version: %s", version))
        end
        
        return true
    else
        print("✗ Could not find Python 3 executable")
        print("  Some Neovim plugins may not work properly")
        print("  Please install Python 3 and ensure it's in PATH")
        return false
    end
end

-- 导出函数供外部使用
function M.get_host_prog()
    return vim.g.python3_host_prog
end

return M

