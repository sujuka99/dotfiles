-- vim: foldmethod=marker
local cmd, fn, opt = vim.cmd, vim.fn, vim.opt
local command = vim.api.nvim_create_user_command

-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

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

-- LSP Zero
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local handlers = {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide targeted overrides for specific servers.
    ["ruff_lsp"] = function ()
        local lspconfig = require("lspconfig")
        lspconfig.ruff_lsp.setup {
            init_options = {
                settings = {
                    -- Any extra CLI arguments for `ruff` go here.
                    args = {"--config=$HOME/.config/ruff/ruff.toml"},
                }
            }
        }
    end,
}


require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = handlers})
-- (Optional) Configure lua language server for neovim

-----------------------------------------------------------------------------//
-- Utils
-----------------------------------------------------------------------------//
opt.clipboard = 'unnamedplus'
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

-- file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

print("Loaded nvim/init.lua")
