vim.pack.add({
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
  { src = 'https://github.com/akinsho/git-conflict.nvim' },
}, { load = true })

require('gitsigns').setup()
require('git-conflict').setup()
