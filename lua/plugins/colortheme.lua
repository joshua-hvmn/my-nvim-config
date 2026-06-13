return {
  'EdenEast/nightfox.nvim',
  lazy = false,
  priority = 1000, -- Load this early
  config = function()
    -- Default to carbonfox on startup
    vim.cmd [[colorscheme carbonfox]]
    -- Create a custom command called :FoxToggle
    vim.api.nvim_create_user_command('FoxToggle', function()
      if vim.g.colors_name == 'carbonfox' then
        vim.cmd 'colorscheme dayfox'
        print 'Switched to Dayfox ☀️'
      else
        vim.cmd 'colorscheme carbonfox'
        print 'Switched to Carbonfox 🌙'
      end
    end, {})
  end,
}
