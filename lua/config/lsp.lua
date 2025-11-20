-- local nvim_lsp = require("lspconfig")
-- local capabilities = require("blink.cmp").get_lsp_capabilities()
-- local util = require("lspconfig.util")

vim.lsp.config("jdtls", {
    init_options = {
        bundles = require("spring_boot").java_extensions(),
    },
    settings = {
        java = {
            inlayHints = { parameterNames = { enabled = "all" } },
            signatureHelp = { enabled = true },
        },
    },
})

vim.lsp.enable("jdtls")
