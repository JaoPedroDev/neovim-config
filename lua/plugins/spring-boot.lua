return {
    "JavaHello/spring-boot.nvim",
    ft = { "java", "yaml", "jproperties" },
    dependencies = {
        -- "mfussenegger/nvim-jdtls", -- or nvim-java, nvim-lspconfig
        -- "ibhagwan/fzf-lua", -- optional, for UI features like symbol picking. Other pickers (e.g., telescope.nvim) can also be used.
    },
    ---@type bootls.Config
    opts = {},
}
