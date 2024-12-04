vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.g.have_nerd_font = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.termguicolors = true

vim.diagnostic.config({ virtual_text = false })

vim.g.markdown_fenced_languages = {
    "ts=typescript",
}

require("config.lazy")
require("config.keymaps")
require("config.autocommands")
require("config.lspconfig")
if vim.g.neovide then
    require("config.neovide")
end

-- Editor Configs
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.showmode = false

vim.opt.signcolumn = "yes"

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Indentention
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

function ReloadConfig()
    for name, _ in pairs(package.loaded) do
        if name:match("^user") then
            package.loaded[name] = nil
        end
    end
    dofile(vim.fn.stdpath("config") .. "/init.lua")
    print("Configuration reloaded!")
end

vim.api.nvim_create_user_command("ReloadConfig", function()
    ReloadConfig()
end, {})
