return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
	require("catppuccin").setup({
		flavor = "frappe",
		transparent_background = true,
	})
	vim.cmd.colorscheme "catppuccin"
	end,
}
