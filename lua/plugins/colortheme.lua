return {
  'shaunsingh/nord.nvim',
  lazy = false,
  priority = 1000,
  init = function()
    -- Set global theme options before the plugin loads
    vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = true
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false
    -- Keeps the line highlight layer completely clear/flat
    vim.g.nord_cursorline_transparent = false
    -- Keeps sidebar backgrounds filled in even if you made the main background transparent
    vim.g.nord_enable_sidebar_background = false
  end,
  config = function()
    -- Load the colorscheme safely using standard Neovim API
    vim.cmd [[colorscheme nord]]

    -- Force specific, robust color separation for keywords vs values
    -- You can swap out these hex colors with any palette colors you prefer!
    local colors = {
      nord_blue_cyan = '#88C0D0',
      nord_orange = '#D08770',
    }

    -- 1. Keywords like 'return', 'function', 'local'
    vim.api.nvim_set_hl(0, '@keyword', { fg = colors.nord_blue_cyan, bold = true })
    vim.api.nvim_set_hl(0, 'Keyword', { fg = colors.nord_blue_cyan, bold = true })

    -- 2. Booleans like 'true' and 'false'
    vim.api.nvim_set_hl(0, '@boolean', { fg = colors.nord_orange })
    vim.api.nvim_set_hl(0, 'Boolean', { fg = colors.nord_orange })

    -- 3. Functions (e.g., print(), setup(), require())
    vim.api.nvim_set_hl(0, '@function', { fg = '#81A1C1', italic = true })
    vim.api.nvim_set_hl(0, 'Function', { fg = '#81A1C1', italic = true })

    -- 4. Strings (e.g., "hello world", 'plugins')
    vim.api.nvim_set_hl(0, '@string', { fg = '#A3BE8C' })
    vim.api.nvim_set_hl(0, 'String', { fg = '#A3BE8C' })

    -- 5. Comments (e.g., -- This is a comment)
    vim.api.nvim_set_hl(0, '@comment', { fg = '#8FBCBB', italic = true })
    vim.api.nvim_set_hl(0, 'Comment', { fg = '#8FBCBB', italic = true })

    -- 6. Variables and Identifiers
    vim.api.nvim_set_hl(0, '@variable', { fg = '#E5E9F0' })
  end,
}
