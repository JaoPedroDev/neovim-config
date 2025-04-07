local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
    capabilities = capabilities,
    -- on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    single_file_support = false
})

local mason_registry = require("mason-registry")
local vue_language_server = mason_registry.get_package("vue-language-server"):get_install_path()
    .. "/node_modules/@vue/language-server"

nvim_lsp.ts_ls.setup({
    capabilities = capabilities,
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_language_server,
                languages = { "vue" },
            }
        }
    },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
})

require("luasnip.loaders.from_vscode").lazy_load()
