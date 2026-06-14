return {
  'EdenEast/nightfox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local themes = require 'core.themes'

    -- Default to carbonfox on startup
    vim.cmd.colorscheme(themes.dark)
  end,
}
