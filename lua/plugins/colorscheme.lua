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
                    LineNr = { fg = colors.overlay1 },
                    -- For visual mode selection
                    Visual = { bg = colors.pink, fg = colors.crust },
                    -- For visual line mode (V)
                    VisualNOS = { bg = colors.pink, fg = colors.crust },
                    -- For visual block mode (Ctrl-V)
                    VisualMulti = { bg = colors.pink, fg = colors.crust },
                }
            end,
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
