local tb = require("telescope.builtin")
local wk = require("which-key")

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
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('start-lsp-attach', { clear = true }),
    callback = function (event)
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map('gd', tb.lsp_definitions, '[G]oto [D]efinition')

        -- Find references for the word under your cursor.
        map('gr', tb.lsp_references, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('gI', tb.lsp_implementations, '[G]oto [I]mplementation')

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map('<leader>D', tb.lsp_type_definitions, 'Type [D]efinition')

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map('<leader>ds', tb.lsp_document_symbols, '[D]ocument [S]ymbols')

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        map('<leader>ws', tb.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('<leader>da', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    end
})

---- Which-key mappings ----
wk.add({
    mode = { "n" },
    { "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "File explorer" },
    { "<leader>c", "<cmd>BufferClose<CR>", desc = "Close current buffer" }
})
