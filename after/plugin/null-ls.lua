local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.eslint,
		null_ls.builtins.diagnostics.eslint,
	}
})

require("mason-null-ls").setup({
	handlers = {
		prettier = function(source_name, methods)
			null_ls.register(null_ls.builtins.formatting.prettier)
		end,
	}
})
