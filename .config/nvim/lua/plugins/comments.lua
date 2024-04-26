return {
  {
    'numToStr/Comment.nvim',
    keys = {
      { 'gc', mode = { 'n', 'v' } },
      { 'gb', mode = { 'n', 'v' } },
    },
    opts = function()
      return {
        ignore = '^$', -- ignore empty lines
        pre_hook = require(
          'ts_context_commentstring.integrations.comment_nvim'
        ).create_pre_hook(),
      }
    end,
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    config = function(_, opts)
      require('Comment').setup(opts)
      local ft = require 'Comment.ft'
      ft.helm = { '{{/* %s */}}', '{{/* %s */}}' }
    end,
  }
}
