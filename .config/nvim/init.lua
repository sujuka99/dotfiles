-- vim: foldmethod=marker
local cmd, fn, opt = vim.cmd, vim.fn, vim.opt
local command = vim.api.nvim_create_user_command

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

vim.g.mapleader = " "

require("lazy").setup("plugins")


-- LSP Zero
local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})
-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()
lsp.setup()

-----------------------------------------------------------------------------//
-- Indentation {{{1
-----------------------------------------------------------------------------//
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Size of an indent
opt.smartindent = true -- Insert indents automatically
opt.tabstop = 4 -- Number of spaces tabs count for
opt.softtabstop = 4
opt.shiftround = true -- Round indent
opt.joinspaces = false -- No double spaces with join after a dot

-----------------------------------------------------------------------------//
-- Display {{{1
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

-----------------------------------------------------------------------------//
-- Title {{{1
-----------------------------------------------------------------------------//
--opt.titlestring = '❐ %t'
--opt.titleold = '%{fnamemodify(getcwd(), ":t")}'
--opt.title = true -- show info in the window title
--opt.titlelen = 70


-- display the current mode in the status line
opt.showmode = true

print("Loaded nvim/init.lua")
