return {
    "nvim-treesitter/nvim-treesitter",
    enabled = false,
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
}
