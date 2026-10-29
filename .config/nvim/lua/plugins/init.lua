-- Load order matters: colorscheme and snacks first (early UI), then
-- treesitter/completion before lsp (lsp wires up blink.cmp capabilities).
require('plugins.colorscheme')
require('plugins.snacks')
require('plugins.treesitter')
require('plugins.completion')
require('plugins.lsp')
require('plugins.git')
require('plugins.editor')
require('plugins.markdown')
require('plugins.statusline')
