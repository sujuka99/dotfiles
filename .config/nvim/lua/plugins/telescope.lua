return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  keys = {
    {
      '<leader>ff',
      '<cmd>Telescope find_files<cr>',
      desc = 'Telescope find_files',
    },
    {
      '<leader>fg',
      '<cmd>Telescope live_grep<cr>',
      desc = 'Telescope live_grep',
    },
    {
      '<leader>fb',
      '<cmd>Telescope buffers<cr>',
      desc = 'Telescope buffers',
    },
    {
      '<leader>fh',
      '<cmd>Telescope help_tags<cr>',
      desc = 'Telescope help_tags',
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
  },
}
