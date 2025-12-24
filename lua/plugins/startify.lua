return {
  'mhinz/vim-startify',
  event = 'VimEnter', -- Load on VimEnter for startup screen
  config = function()
    -- Basic settings
    vim.g.startify_enable_special = 0      -- Disable special buffer entries
    vim.g.startify_change_to_dir = 0       -- Don't change to file's directory
    vim.g.startify_change_to_vcs_root = 1  -- Change to VCS root
    vim.g.startify_session_persistence = 1 -- Remember sessions
    vim.g.startify_update_oldfiles = 1     -- Update oldfiles list on buffer write
    vim.g.startify_files_number = 8        -- Number of files to list
    vim.g.startify_relative_path = 1       -- Show relative paths
    
    -- Custom header with ASCII art or emojis
    vim.g.startify_custom_header = {
      '',
      '   ╭───────────────────────────────────────────────────────╮',
      '   │                                                       │',
      '   │   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  │',
      '   │   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  │',
      '   │   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  │',
      '   │   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  │',
      '   │   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  │',
      '   │   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  │',
      '   │                                                       │',
      '   ╰───────────────────────────────────────────────────────╯',
      '',
    }
    
    -- Alternative: Simple header
    -- vim.g.startify_custom_header = 'startify#center(startify#fortune#boxed())'
    
    -- Custom lists order
    vim.g.startify_lists = {
      { type = 'sessions',  header = {'   💾 Sessions'} },
      { type = 'bookmarks', header = {'   🔖 Bookmarks'} },
      { type = 'files',     header = {'   📁 Recent Files'} },
      { type = 'dir',       header = {'   📂 Files in ' .. vim.fn.getcwd() .. ''} },
      { type = 'commands',  header = {'   ⚡ Commands'} },
    }
    
    -- Bookmarks
    vim.g.startify_bookmarks = {
      { z = '~/.zshrc' },
      { p = '~/.profile' },
      { t = '~/.tmux.conf' },
      { f = '~/.config/fish/config.fish' },
      { v = '~/.vimrc' },
    }
    
    -- Custom commands section
    vim.g.startify_commands = {
      { up = { 'Update Plugins', ':Lazy update' } },
      { ch = { 'Check Health', ':checkhealth' } },
      { ts = { 'Toggle Startify', ':Startify' } },
      { te = { 'Toggle Explorer', ':NvimTreeToggle' } },
    }
    
    -- Session settings
    vim.g.startify_session_dir = vim.fn.stdpath('data') .. '/sessions'
    vim.g.startify_session_autoload = 1
    vim.g.startify_session_delete_buffers = 1
    
    -- Custom footer
    vim.g.startify_custom_footer = {
      '',
      '   🕒 ' .. os.date('%H:%M'),
      '   📅 ' .. os.date('%A, %B %d, %Y'),
      '   📍 ' .. vim.fn.getcwd(),
      '',
    }
    
    -- Highlight groups
    vim.cmd([[
      hi! link StartifyBracket Comment
      hi! link StartifyFile    Identifier
      hi! link StartifyNumber  Number
      hi! link StartifyPath    Directory
      hi! link StartifySlash   Directory
      hi! link StartifySection Statement
      hi! link StartifySpecial Normal
      hi! link StartifyHeader  Title
    ]])
    
    -- Auto commands for better integration
    vim.api.nvim_create_autocmd('User', {
      pattern = 'StartifyReady',
      callback = function()
        -- Set keymaps for Startify buffer
        vim.keymap.set('n', '<leader>ss', '<cmd>Startify<CR>', { buffer = true, desc = 'Show Startify' })
        vim.keymap.set('n', '<leader>sq', '<cmd>qa<CR>', { buffer = true, desc = 'Quit Neovim' })
      end
    })
  end,
  keys = {
    -- Global keymaps to open Startify
    { '<leader>hs', '<cmd>Startify<CR>', desc = 'Home Screen' },
    { '<leader>ss', '<cmd>SSave<CR>', desc = 'Save Session' },
    { '<leader>sl', '<cmd>SLoad<CR>', desc = 'Load Session' },
  }
}

