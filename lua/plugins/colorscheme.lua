return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({
            flavor = "frappe",
            transparent_background = true,
            custom_highlights = function(colors)
                return {
                    CursorLineNr = { fg = colors.pink },
                    LineNr = { fg = colors.overlay1 }
                }
            end
        })
        vim.cmd.colorscheme "catppuccin"
    end,
}
