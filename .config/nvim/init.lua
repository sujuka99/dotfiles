-- vim: foldmethod=marker
local cmd, fn, opt = vim.cmd, vim.fn, vim.opt
local command = vim.api.nvim_create_user_command

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- set Leader before plugins setup
vim.g.mapleader = " "
vim.g.maplocalleader = ','

require("lazy").setup("plugins")

-- empty nvim-tree setup using defaults
-- require("nvim-tree").setup()
-- require("nvim-tree.api").tree.open()

-----------------------------------------------------------------------------//
-- LSP
-----------------------------------------------------------------------------//

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = cmp.mapping.preset.insert({
    -- Enter key confirms completion item
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl + space triggers completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

-----------------------------------------------------------------------------//
-- Utils
-----------------------------------------------------------------------------//
-- Could break plugins, use `:cd %:h` to set to current file or `:cd mydir`
-- similarly to the way `cd` works in Bash
opt.autochdir = false

-----------------------------------------------------------------------------//
-- Indentation
-----------------------------------------------------------------------------//
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Size of an indent
opt.smartindent = true -- Insert indents automatically
opt.tabstop = 4 -- Number of spaces tabs count for
opt.softtabstop = 4
opt.shiftround = true -- Round indent
opt.joinspaces = false -- No double spaces with join after a dot
-- Folding (doesn't work)
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldenable = false

-----------------------------------------------------------------------------//
-- Display
-----------------------------------------------------------------------------//
opt.number = true -- line numbers
opt.relativenumber = false -- relative line numbers
opt.numberwidth = 2
opt.signcolumn = 'yes:1' -- 'auto:1-2'
opt.cursorline = true
opt.linebreak = true -- wrap, but on words, not randomly
opt.virtualedit = 'onemore' -- allow cursor to move past end of line in visual block mode
opt.list = true -- show invisible characters
opt.listchars = {
    eol = ' ', -- ¬↴
    tab = '→ ',
    extends = '…',
    precedes = '…',
    trail = '·',
}
opt.showmode = true -- display the current mode in the status line

-----------------------------------------------------------------------------//
-- Title
-----------------------------------------------------------------------------//
--opt.titlestring = '❐ %t'
--opt.titleold = '%{fnamemodify(getcwd(), ":t")}'
--opt.title = true -- show info in the window title
--opt.titlelen = 70

-----------------------------------------------------------------------------//
-- Mappings 
-----------------------------------------------------------------------------//
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

-- sensible defaults
vim.keymap.set('', 'Q', '') -- disable
vim.keymap.set('n', 'x', '"_x') -- delete char without yank
vim.keymap.set('x', 'x', '"_x') -- delete visual selection without yank
vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste without yank
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- copy to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- copy line to system clipboard
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- delete without yank

-- file explorer (set in the plugin)
-- vim.keymap.set('n', '<leader>pv', vim.cmd.Lexplore)

-- change dir to current file's parent dir
vim.keymap.set('n', '<leader>cd', ':cd %:h<CR>')
-- remove highlights
vim.keymap.set('n', '<leader>nh', ':noh<CR>')

vim.keymap.set('n', '<leader>s', ':update<CR>')


-----------------------------------------------------------------------------//
-- netrw
-----------------------------------------------------------------------------//
-- preview window opens in vertical split
-- vim.g.netrw_preview = 1
-- list as tree
-- vim.g.netrw_liststyle = 3
-- When previewing do a 30-70 split
-- vim.g.netrw_winsize = 30
-- c-tab tooggle netrw win width
-- vim.g.netrw_usetab = 1
-- minimum netrw window width
-- vim.g.netrw_wiw = 15
-- open windows on the right
-- vim.g.netrw_altv = 1
-- split below
-- vim.g.netrw_alto = 1

print("Loaded nvim/init.lua")
