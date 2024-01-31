local au = vim.api.nvim_create_augroup('LspAttach', { clear = true })
return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile' },
    init = function()
      -- client log level
      vim.lsp.set_log_level(vim.lsp.log_levels.INFO)

      vim.api.nvim_create_user_command('Format', function()
        vim.lsp.buf.format { async = false }
      end, {})

      vim.api.nvim_create_autocmd('LspAttach', {
        group = au,
        desc = 'LSP actions',
        callback = function(args)
          local bufnr = args.buf
          local function map(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
          end

          -- these will be buffer-local keybindings
          -- because they only work if you have an active language server

          map('n', 'K', vim.lsp.buf.hover)
          map('n', 'gd', vim.lsp.buf.definition)
          map('n', 'gD', vim.lsp.buf.declaration)
          map('n', 'gi', vim.lsp.buf.implementation)
          map('n', 'go', vim.lsp.buf.type_definition)
          map('n', 'gr', vim.lsp.buf.references)
          map('n', 'gs', vim.lsp.buf.signature_help)
          map('n', '<F2>', vim.lsp.buf.rename)
          map({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({async = true})end)
          map('n', '<F4>', vim.lsp.buf.code_action)
        end
      })
    end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
      {
        'williamboman/mason.nvim',
        config = true,
      },
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          ensure_installed = {},
          handlers = {
            function(server)
              require('lspconfig')[server].setup({
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
              })
            end,
            ['lua_ls'] = function()
              require('lspconfig').lua_ls.setup({
                capabilisties = require('cmp_nvim_lsp').default_capabilities(),
                settings = {
                  Lua = {
                    runtime = {
                      version = 'LuaJIT'
                    },
                    diagnostics = {
                      globals = {'vim'},
                    },
                    workspace = {
                      library = {
                        vim.env.VIMRUNTIME,
                      }
                    }
                  }
                }
              })
            end,
          },
        },
      },
    }
  },
}
