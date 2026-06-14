-- helper file for the MyHelp command
local M = {}

function M.open_floating_cheatsheet()
  -- 1. Find and read cheatsheet
  local help_file = vim.fn.stdpath 'config' .. '/lua/core/my_cheatsheet.md'

  local lines = {}
  if vim.fn.filereadable(help_file) == 1 then
    lines = vim.fn.readfile(help_file)
  else
    lines = { 'ERROR: Cheatsheet not found at:', help_file }
  end

  -- 2. Create an unlisted scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- 3. Calculate dynamic dimensions
  local ui = vim.api.nvim_list_uis()[1]
  local width = math.floor(ui.width * 0.65)
  local height = math.floor(ui.height * 0.75)
  local col = math.floor((ui.width - width) / 2)
  local row = math.floor((ui.height - height) / 2)

  -- 4. Window config
  local win_opts = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded',
    title = '💡 My Personal Cheatsheet',
    title_pos = 'center',
  }

  -- 5. Open the floating window
  local win = vim.api.nvim_open_win(buf, true, win_opts)

  -- 6. Style and safety settings
  vim.api.nvim_set_option_value('filetype', 'markdown', { buf = buf })
  vim.api.nvim_set_option_value('modifiable', false, { buf = buf })
  vim.api.nvim_set_option_value('readonly', true, { buf = buf })

  vim.wo[win].conceallevel = 2 -- Conceals raw markdown syntax symbols (like ** or `)
  vim.wo[win].concealcursor = 'nc' -- Keeps symbols concealed in Normal and Command modes

  -- Force Treesitter to attach to the new buffer immediately if it's installed
  pcall(vim.treesitter.start, buf, 'markdown')

  -- 7. Seamless 'q' binding to shut down the floating UI window
  vim.keymap.set('n', 'q', function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, silent = true })
end

return M
