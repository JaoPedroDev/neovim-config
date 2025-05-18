local nvim_lsp = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

nvim_lsp.gdscript.setup({
    root_dir = nvim_lsp.util.root_pattern("*.gd"),
    capabilities = capabilities,
})
