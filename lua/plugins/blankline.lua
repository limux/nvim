return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  
  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

    local chars = {
      "│",  -- Box Drawings Light Vertical
      "┃",  -- Box Drawings Heavy Vertical
      "┆",  -- Box Drawings Light Triple Dash Vertical
      "┇",  -- Box Drawings Heavy Triple Dash Vertical
      "┊",  -- Box Drawings Light Quadruple Dash Vertical
      "┋",  -- Box Drawings Heavy Quadruple Dash Vertical
      "╎",  -- Box Drawings Light Double Dash Vertical
      "╏",  -- Box Drawings Heavy Double Dash Vertical
      "▏",  -- Left One Eighth Block
      "▕",  -- Right One Eighth Block
    }

    require("ibl").setup {
      indent = {
        char = chars[5],
        highlight = highlight,
      }
    }
  end
}

