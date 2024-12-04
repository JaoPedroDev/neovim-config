local nvim_lsp = require("lspconfig")
nvim_lsp.denols.setup({
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
    init_options = {
        lint = true,
        unstable = true,
        suggest = {
            imports = {
                hosts = {
                    ["https://deno.land"] = true,
                    ["https://cdn.nest.land"] = true,
                    ["https://crux.land"] = true,
                },
            },
        },
    },
})

nvim_lsp.ts_ls.setup({
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    single_file_support = false,
})
