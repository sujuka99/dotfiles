vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' }, -- default server configs for vim.lsp.config/enable
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
}, { load = true })

require('mason').setup({
  registries = {
    'github:mason-org/mason-registry',
    'github:Crashdummyy/mason-registry', -- more up-to-date roslyn (C#) builds
  },
})

require('mason-tool-installer').setup({
  ensure_installed = {
    'lua-language-server',
    'basedpyright',
    'ruff',
    'typescript-language-server',
    'css-lsp',
    'html-lsp',
    'rust-analyzer',
    'roslyn',
  },
})

-- blink.cmp's capabilities apply to every server via the '*' config
vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.enable({
  'lua_ls',
  'basedpyright',
  'ruff',
  'ts_ls',
  'html',
  'cssls',
})

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP: Go to definition' })
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'LSP: Line diagnostics' })
