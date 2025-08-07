return {
  {
    'mason-org/mason.nvim',
    opts = {},
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- LSP completion
      'hrsh7th/cmp-buffer', -- Buffer words
      'hrsh7th/cmp-path', -- Filesystem paths
      'hrsh7th/cmp-cmdline', -- Cmdline completion
      'L3MON4D3/LuaSnip', -- Snippets
      'saadparwaiz1/cmp_luasnip', -- Snippet integration
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' },
            },
          },
        }),
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
      if cmp_ok then
        capabilities = cmp_nvim_lsp.default_capabilities()
      end
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        local keymap = vim.keymap.set
        keymap('n', 'gd', vim.lsp.buf.definition, opts)
      end
      local servers = {
        lua_ls = {
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
        },
        basedpyright = {},
      }

      for name, config in pairs(servers) do
        config.capabilities = capabilities
        config.on_attach = on_attach
        lspconfig[name].setup(config)
      end
    end,
    dependencies = {
      'nvim-cmp',
    },
  },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'lua_ls',
        'basedpyright',
      },
    },
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
  },
}
