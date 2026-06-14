-- All command functions go here
-- Keymaps in core/keymaps.lua

-- Custom help menu
-- Displays keymaps and useful commands
vim.api.nvim_create_user_command('MyHelp', function()
  local help_file = vim.fn.stdpath 'config' .. 'lua/core/my_cheatsheet.md'

  vim.cmd('rightbelow vsplit ' .. help_file)

  vim.bo.readonly = true
  vim.bo.modifiable = false
  vim.bo.buftype = 'nofile'
  vim.bo.bufhidden = 'wipe'
end, { desc = 'Open personal Neovim cheatsheet' })

-- Toggle between light and dark theme
-- Switches between carbonfox and dayfox
vim.api.nvim_create_user_command('ThemeChange', function()
  local themes = require 'core.themes'

  if vim.g.colors_name == themes.dark then
    vim.cmd.colorscheme(themes.light)
    print 'Switched to Dayfox ☀️'
  else
    vim.cmd.colorscheme(themes.dark)
    print 'Switched to Carbonfox 🌙'
  end
end, { desc = 'Switch colortheme' })
