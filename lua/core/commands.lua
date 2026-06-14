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
  local messages = require 'core.messages'

  if vim.g.colors_name == themes.dark then
    vim.cmd.colorscheme(themes.light)
    print(messages.theme_switched_light)
  else
    vim.cmd.colorscheme(themes.dark)
    print(messages.theme_switched_dark)
  end
end, { desc = 'Switch colortheme' })
