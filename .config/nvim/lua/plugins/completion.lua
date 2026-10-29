vim.pack.add({
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range('1') },
}, { load = true })

require('blink.cmp').setup({
  keymap = { preset = 'default' },
  appearance = { nerd_font_variant = 'mono' },
  completion = { documentation = { auto_show = true } },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
})
