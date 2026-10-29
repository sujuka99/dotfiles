vim.pack.add({
  { src = 'https://github.com/navarasu/onedark.nvim' },
}, { load = true })

require('onedark').setup({ style = 'warmer' })
require('onedark').load()
