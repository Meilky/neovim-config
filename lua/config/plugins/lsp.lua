return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()

			vim.lsp.config("ruff", {
				init_options = {
					settings = {
						configurationPreference = "filesystemFirst",
					},
				},
			})

			vim.lsp.enable("ruff")
		end,
	},
}
