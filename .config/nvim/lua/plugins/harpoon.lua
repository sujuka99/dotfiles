return {
    "theprimeagen/harpoon",
    keys = {
        {
            "<leader>ha",
            "<cmd>lua require('harpoon.mark').add_file()<cr>",
            desc = "Harpoon add files",
        },
        {
            "<leader>hm",
            "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
            desc = "Harpoon toggle menu",
        },
        {
            "<leader>hr",
            "<cmd>lua require('harpoon.mark').rm_file()<cr>",
            desc = "Harpoon toggle menu",
        },

    },
    dependencies = {"nvim-lua/plenary.nvim"}
}
