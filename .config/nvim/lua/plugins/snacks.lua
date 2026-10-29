vim.pack.add({
  { src = 'https://github.com/folke/snacks.nvim' },
}, { load = true })

require('snacks').setup({
  bigfile = { enabled = true },
  -- default sections include a `startup` section that requires lazy.nvim
  -- (`lazy.stats`); we use vim.pack, so drop it and keep header + keys.
  dashboard = {
    enabled = true,
    sections = {
      { section = 'header' },
      { section = 'keys', gap = 1, padding = 1 },
    },
  },
  explorer = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true },
  picker = { enabled = true },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
})

local map = vim.keymap.set
map('n', '<leader>e', function() Snacks.explorer() end, { desc = 'File Explorer' })
map('n', '<leader>ff', function() Snacks.picker.files() end, { desc = 'Find Files' })
map('n', '<leader>fg', function() Snacks.picker.grep() end, { desc = 'Live Grep' })
map('n', '<leader>fb', function() Snacks.picker.buffers() end, { desc = 'Buffers' })
map('n', '<leader>fh', function() Snacks.picker.help() end, { desc = 'Help Tags' })
map('n', '<leader>n', function() Snacks.picker.notifications() end, { desc = 'Notification History' })
map('n', '<leader>gg', function() Snacks.lazygit() end, { desc = 'LazyGit' })
