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
require("nvim-tree").setup()
require("nvim-tree.api").tree.open()

-- LSP Zero
-- local lsp = require('lsp-zero').preset({
--     name = 'minimal',
--     set_lsp_keymaps = true,
--     manage_nvim_cmp = true,
--     suggest_lsp_servers = false,
-- })

-- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()
-- lsp.setup()

-----------------------------------------------------------------------------//
-- Utils
-----------------------------------------------------------------------------//
opt.clipboard = 'unnamedplus'

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

-- sensible defaults
vim.keymap.set('', 'Q', '') -- disable
vim.keymap.set('n', 'x', '"_x') -- delete char without yank
vim.keymap.set('x', 'x', '"_x') -- delete visual selection without yank

print("Loaded nvim/init.lua")
