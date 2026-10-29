vim.pack.add({
  { src = 'https://github.com/kylechui/nvim-surround', version = vim.version.range('3') },
  { src = 'https://github.com/folke/trouble.nvim' },
  { src = 'https://github.com/rmagatti/goto-preview' },
  { src = 'https://github.com/lambdalisue/suda.vim' },
}, { load = true })

require('nvim-surround').setup()
require('goto-preview').setup({ default_mappings = true })
require('trouble').setup()

local map = vim.keymap.set
map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' })
map('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Buffer Diagnostics (Trouble)' })
map('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = 'Symbols (Trouble)' })
map(
  'n',
  '<leader>cl',
  '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
  { desc = 'LSP Definitions / references / ... (Trouble)' }
)
map('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location List (Trouble)' })
map('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', { desc = 'Quickfix List (Trouble)' })
