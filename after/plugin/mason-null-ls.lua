local null_ls = require("null-ls");

require("mason-null-ls").setup({
	handlers = {
		prettier = function(source_name, methods)
			null_ls.register(null_ls.builtins.formatting.prettier)
		end,
	}
})
