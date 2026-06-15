return {
  'joshua-hvmn/peeksheet.nvim',
  lazy = false,
  config = function()
    require('peeksheet').setup {}
  end,
  keys = {
    { '<leader>h', '<cmd>Peeksheet<CR>', desc = 'Open Peeksheet' },
  },
}
