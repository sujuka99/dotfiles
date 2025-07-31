-- sensible defaults
vim.keymap.set('', 'Q', '') -- disable
vim.keymap.set('n', 'x', '"_x') -- delete char without yank
vim.keymap.set('x', 'x', '"_x') -- delete visual selection without yank
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- delete without yank

-- file explorer (set in the plugin)
-- vim.keymap.set('n', '<leader>pv', vim.cmd.Lexplore)

vim.keymap.set('n', '<leader>s', ':update<CR>')
