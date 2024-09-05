return  {
  -- {
  --   "mcchrish/zenbones.nvim",
  --   name = "zenbones",
  --   -- priority = 1000,
  --   config = function()
  --     vim.g.zenbones = { darkness = "stark", lightness = "bright" }
  --     vim.cmd([[
  --       set background=dark
  --       colorscheme zenbones
  --     ]])
  --   end,
  --   dependencies = { "rktjmp/lush.nvim" },
  -- },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    -- priority = 9999,
    config = function()
      require('onedark').setup {
        style = 'warmer'
      }
      require('onedark').load()
    end,
  },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function()
  --     require('kanagawa').setup {
  --       theme = "lotus",
  --       background = {},
  --     }
  --     require('kanagawa').load()
  --   end,
  -- },
  -- {
  --   "marko-cerovac/material.nvim",
  --   lazy = false,
  --   priority = 9999,
  --   config = function ()
  --     require("material").setup()
  --   end
  -- },
    -- {
    --   'sainnhe/sonokai',
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     -- Optionally configure and load the colorscheme
    --     -- directly inside the plugin declaration.
    --     vim.g.sonokai_enable_italic = true
    --     vim.g.sonokai_style = 'espresso'
    --     vim.cmd.colorscheme('sonokai')
    --   end
    -- }
}
