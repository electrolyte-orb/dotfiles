return {
	"tiagovla/tokyodark.nvim",
	config = function()
		require("tokyodark").setup({
			gamma = 1.05,
			styles = {
				comments = { italic = false }, -- style for comments
				keywords = { italic = false }, -- style for keywords
				identifiers = { italic = false }, -- style for identifiers
				functions = {}, -- style for functions
				variables = {}, -- style for variables
			},
		}) -- calling setup is optional
		vim.cmd([[colorscheme tokyodark]])
	end,
}
