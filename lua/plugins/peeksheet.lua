return {
  'joshua-hvmn/peeksheet.nvim',
  lazy = true,
  cmd = 'Peeksheet',
  keys = {
    { '<leader>h', '<cmd>Peeksheet<CR>', desc = 'Open Peeksheet' },
  },
  config = function()
    require('peeksheet').setup {}
  end,
}
