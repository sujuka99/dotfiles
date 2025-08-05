-----------------------------------------------------------------------------//
-- LSP
-----------------------------------------------------------------------------//

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 1
vim.opt.foldnestmax = 4

-----------------------------------------------------------------------------//
-- Utils
-----------------------------------------------------------------------------//
-- Could break plugins, use `:cd %:h` to set to current file or `:cd mydir`
-- similarly to the way `cd` works in Bash
vim.opt.autochdir = false

-----------------------------------------------------------------------------//
-- Indentation
-----------------------------------------------------------------------------//
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.softtabstop = 4
vim.opt.shiftround = true -- Round indent
vim.opt.joinspaces = false -- No double spaces with join after a dot

-----------------------------------------------------------------------------//
-- Display
-----------------------------------------------------------------------------//
vim.opt.number = true -- line numbers
vim.opt.relativenumber = false -- relative line numbers
vim.opt.numberwidth = 2
vim.opt.signcolumn = 'yes:1' -- 'auto:1-2'
vim.opt.cursorline = true
vim.opt.linebreak = true -- wrap, but on words, not randomly
vim.opt.virtualedit = 'onemore' -- allow cursor to move past end of line in visual block mode
vim.opt.list = true -- show invisible characters
vim.opt.listchars = {
    eol = ' ', -- ¬↴
    tab = '→ ',
    extends = '…',
    precedes = '…',
    trail = '·',
}
vim.opt.showmode = true -- display the current mode in the status line
vim.opt.conceallevel = 1
