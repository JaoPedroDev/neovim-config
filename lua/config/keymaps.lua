local tb = require("telescope.builtin")
local wk = require("which-key")
local cmp = require("cmp")

---- Non-Leader mappings ----
-- Move line up and down
vim.keymap.set("n", "<M-Down>", "<cmd>m .+1<CR>==")
vim.keymap.set("n", "<M-Up>", "<cmd>m .-2<CR>==")

vim.keymap.set("i", "<M-Down>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<M-Up>", "<Esc>:m .-2<CR>==gi")

vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv")

-- Next tab
vim.keymap.set("n", "<C-Right>", "<cmd>BufferNext<CR>")
vim.keymap.set("n", "<C-Left>", "<cmd>BufferPrevious<CR>")

-- Clear highlights on search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("start-lsp-attach", { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", tb.lsp_definitions, "[G]oto [D]efinition")

        map("gr", tb.lsp_references, "[G]oto [R]eferences")

        map("gI", tb.lsp_implementations, "[G]oto [I]mplementation")

        map("<leader>lD", tb.lsp_type_definitions, "Type [D]efinition")

        map("<leader>ls", tb.lsp_document_symbols, "[D]ocument [S]ymbols")

        map("<leader>lS", tb.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        map("<leader>lr", vim.lsp.buf.rename, "[R]ename")

        map("<leader>la", vim.lsp.buf.code_action, "Code [A]ction", { "n", "x" })

        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        vim.keymap.set("n", "K", cmp.mapping.open_docs())

        wk.add({
            { "<leader>l", group = "LSP" },
        })
    end,
})

---- Which-key mappings ----
wk.add({
    mode = { "n" },
    { "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "File explorer" },
    { "<leader>c", "<cmd>BufferClose<CR>", desc = "Close current buffer" },
})

wk.add({
    mode = { "n" },
    { "<leader>s", group = "Search" },
})
