return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "General",
        path = "~/Data/journal/General",
      },
    },
  },
  keys = {
    {
      "<leader>oc",
      "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
      desc = "Obsidian Check Checkbox",
    },
    {
      "<leader>ot",
      "<cmd>ObsidianTemplate<CR>",
      desc = "Insert Obsidian Template",
    },
    {
      "<leader>oo",
      "<cmd>ObsidianOpen<CR>",
      desc = "Open in Obsidian App",
    },
    {
      "<leader>ob",
      "<cmd>ObsidianBackLinks<CR>",
      desc = "Show ObsidianBacklinks",
    },
    {
      "<leader>ol",
      "<cmd>ObsidianLinks<CR>",
      desc = "Show ObsidianLinks",
    },
    {
      "<leader>on",
      "<cmd>ObsidianNew<CR>",
      desc = "Create New Note",
    },
    {
      "<leader>os",
      "<cmd>ObsidianSearch<CR>",
      desc = "Search Obsidian",
    },
    {
      "<leader>oq",
      "<cmd>ObsidianQuickSwitch<CR>",
      desc = "Quick Switch",
    },
  },
}
