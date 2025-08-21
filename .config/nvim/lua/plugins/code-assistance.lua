return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      -- Change the default chat adapter
      chat = {
        adapter = "gemini",
      },
      inline = {
        adapter = "gemini",
      },
      cmd = {
        adapter = "gemini",
      },
    },
    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = "cmd:cat $HOME/.secrets/api-gemini",
          }
        })
      end
    }
  },
  keys = {
    {"<leader>cc", "<cmd>CodeCompanionChat<CR>", desc = "CodeCompanion Chat" },
    {"<leader>ci", "<cmd>CodeCompanion<CR>", desc = "CodeCompanion Inline" },
    {"<leader>ci", "<cmd>CodeCompanion<CR>", mode = "v", desc = "CodeCompanion Inline (Visual Selection)" },
  }
}
