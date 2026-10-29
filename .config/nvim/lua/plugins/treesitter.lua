vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
}, { load = true })

local ensure_installed = {
  'bash',
  'c_sharp',
  'css',
  'diff',
  'dockerfile',
  'gitcommit',
  'gitignore',
  'html',
  'java',
  'javascript',
  'json',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'python',
  'query',
  'regex',
  'rust',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
}

require('nvim-treesitter').install(ensure_installed)

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'bash',
    'c_sharp',
    'cs',
    'css',
    'diff',
    'dockerfile',
    'gitcommit',
    'help',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'markdown',
    'python',
    'query',
    'rust',
    'sh',
    'toml',
    'tsx',
    'typescript',
    'typescriptreact',
    'vim',
    'yaml',
  },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
