return {
	-- Mason
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer" },
			})
		end,
	},
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- lua
			lspconfig.lua_ls.setup({})
			-- tailwind
			lspconfig.tailwindcss.setup({})

			-- biome
			lspconfig.biome.setup({})

			-- rust
			local on_attach = function(client)
				require("completion").on_attach(client)
			end

			lspconfig.rust_analyzer.setup({
				on_attach = on_attach,
				settings = {
					["rust-analyzer"] = {
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						cargo = {
							buildScripts = {
								enable = true,
							},
						},
						procMacro = {
							enable = true,
						},
					},
				},
			})
			-- keybindings
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	-- telescope ui
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- options
						}),
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},
}
