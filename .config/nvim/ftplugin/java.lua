vim.pack.add({
  { src = 'https://github.com/mfussenegger/nvim-jdtls' },
}, { load = true })

local config = {
  cmd = { '/usr/local/bin/jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  capabilities = require('blink.cmp').get_lsp_capabilities(),
}
require('jdtls').start_or_attach(config)
