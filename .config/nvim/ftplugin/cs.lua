vim.pack.add({
  { src = 'https://github.com/seblyng/roslyn.nvim' },
}, { load = true })

require('roslyn').setup()
