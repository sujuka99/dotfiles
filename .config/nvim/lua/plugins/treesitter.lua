return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {"lua", "python", "javascript", "rust", "go", "java"},
          sync_install = true,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end}
