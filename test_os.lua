-- 获取操作系统类型的函数
function get_os_name()
  local os_info = vim.loop.os_uname()
  local sysname = os_info.sysname
  
  if sysname == 'Darwin' then
    return 'macOS'
  elseif sysname == 'Linux' then
    return 'Linux'
  elseif sysname == 'Windows_NT' then
    return 'Windows'
  else
    return sysname
  end
end

-- 使用函数
local os_name = get_os_name()
print("当前操作系统: " .. os_name)

-- 根据系统执行不同操作
if os_name == 'macOS' then
  print("这是苹果电脑")
  -- 设置 macOS 特定的配置
  vim.g.python3_host_prog = '/usr/local/bin/python3'
elseif os_name == 'Linux' then
  print("这是 Linux 系统")
  -- 设置 Linux 特定的配置
  vim.g.python3_host_prog = '/usr/bin/python3'
elseif os_name == 'Windows' then
  print("这是 Windows 系统")
  -- 设置 Windows 特定的配置
  vim.g.python3_host_prog = 'python'
end

