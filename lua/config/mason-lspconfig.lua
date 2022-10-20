require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers({
	function(server_name)
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		require("lspconfig")[server_name].setup({
			capabilities = capabilities
		})
	end,

	["sumneko_lua"] = function()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		require("lspconfig").sumneko_lua.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" }
					}
				}
			}
		})
	end,
})
