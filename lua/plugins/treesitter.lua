return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    -- pcall acts as a shock absorber. It prevents a crash if the file is missing.
    local status_ok, configs = pcall(require, 'nvim-treesitter.config')

    if not status_ok then
      vim.notify('Treesitter failed to load! Check :Lazy to see if it installed.', vim.log.levels.ERROR)
      return
    end

    configs.setup {
      ensure_installed = {
        'lua',
        'python',
        'javascript',
        'typescript',
        'tsx',
        'html',
        'css',
        'bash',
        'markdown',
        'markdown_inline',
        'regex',
        'vim',
        'vimdoc',
        'toml',
        'json',
        'yaml',
        'dockerfile',
        'terraform',
        'sql',
        'make',
        'cmake',
        'go',
        'java',
        'groovy',
        'graphql',
        'gitignore',
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = {
        enable = true,
        disable = { 'ruby' },
      },
    }
  end,
}
