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
require("config.lsp")
require("config.commands")

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

vim.o.title = true
vim.o.titlestring = "nvim - %t"

vim.opt.signcolumn = "yes"

-- Float windows border
vim.opt.winborder = "rounded"

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

vim.opt.fillchars = { eob = " " }
