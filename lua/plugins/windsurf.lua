return {
    "Exafunction/windsurf.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("codeium").setup({
            enable_cmp_source = false,
            virtual_text = {
                enabled = true,
                map_keys = true,
                key_bindings = {
                    accept = "<C-s>",
                    accept_word = "<C-w>",
                },
            },
        })
    end,
}
