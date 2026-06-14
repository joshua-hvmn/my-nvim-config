require 'core.options'
require 'core.keymaps'
require 'core.commands'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.r

require('lazy').setup {
  spec = {
    -- Automatically import everything inside the lua/plugins/ directory
    { import = 'plugins' },
  },
  -- You can add other lazy options here if needed later (like UI or concurrency)
}
-- require('lazy').setup {
--   require 'plugins.neotree',
--   require 'plugins.colortheme',
--   require 'plugins.bufferline',
--   require 'plugins.lualine',
--   require 'plugins.treesitter',
--   require 'plugins.telescope',
--   require 'plugins.lsp',
--   require 'plugins.autocompletion',
--   require 'plugins.autoformatting',
--   require 'plugins.gitsigns',
--   require 'plugins.alpha',
--   require 'plugins.indent_blankline',
--   require 'plugins.misc',
-- }
