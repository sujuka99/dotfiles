return {
  "nvim-tree/nvim-tree.lua",
  enabled = false,
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      filters = {
        git_ignored = false,
      },
    }
  end,
}
