return  {
  {
    "navarasu/onedark.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'warmer'
      }
      require('onedark').load()
    end,
  },
  {
    "mcchrish/zenbones.nvim",
    name = "zenbones",
    -- priority = 1000,
    config = function()
      vim.g.zenbones = { darkness = "stark", lightness = "bright" }
      vim.cmd([[
        set background=dark
        colorscheme zenbones
      ]])
    end,
    dependencies = { "rktjmp/lush.nvim" },
  }
}
