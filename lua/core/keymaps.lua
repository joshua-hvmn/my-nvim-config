-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in normal/visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- Helper function to easily add descriptions to our default opts
local function desc(opts_dict, text)
  return vim.tbl_extend('force', opts_dict, { desc = text })
end

-- ==========================================================================
-- File Operations
-- ==========================================================================
-- Save File
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- Save without auto-formatting
vim.keymap.set('n', '<leader>Sn', '<cmd>noautocmd w <CR>', desc(opts, 'Save without auto-formatting'))

-- Quit File
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- ==========================================================================
-- Plugins & UI
-- ==========================================================================
-- Open Neotree
vim.keymap.set('n', '<leader>e', '<cmd> Neotree toggle position=left<CR>', desc(opts, 'Toggle Neo-tree'))

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', desc(opts, 'Toggle line wrap'))

-- ==========================================================================
-- Navigation & Search (Centered Cursor)
-- ==========================================================================
-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- ==========================================================================
-- Buffers
-- ==========================================================================
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', desc(opts, 'Close current buffer'))
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', desc(opts, 'Open new empty buffer'))

-- ==========================================================================
-- Editing & Indentation
-- ==========================================================================
-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting locally
vim.keymap.set('v', 'p', '"_dP', opts)

-- ==========================================================================
-- System Clipboard (Interacts with your OS)
-- ==========================================================================
-- Copy to system clipboard
vim.keymap.set('v', '<leader>y', '"+y', desc(opts, 'Copy selection to system clipboard'))
vim.keymap.set('n', '<leader>Y', '"+yg_', desc(opts, 'Copy line to system clipboard (no trailing spaces)'))
vim.keymap.set('n', '<leader>y', '"+y', desc(opts, 'Copy motion to system clipboard'))
vim.keymap.set('n', '<leader>yy', '"+yy', desc(opts, 'Copy current line to system clipboard'))

-- Paste from system clipboard
-- Note: Fixed potential visual mode conflict by handling normal vs visual paste smoothly
vim.keymap.set('n', '<leader>p', '"+p', desc(opts, 'Paste system clipboard after cursor'))
vim.keymap.set('n', '<leader>P', '"+P', desc(opts, 'Paste system clipboard before cursor'))
vim.keymap.set('v', '<leader>p', '"+p', desc(opts, 'Paste system clipboard over selection'))
