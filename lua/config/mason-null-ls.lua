local null_ls = require("null-ls");

require("mason-null-ls").setup()

require 'mason-null-ls'.setup_handlers({
	function(source_name, methods)
		require('mason-null-ls.automatic_setup')(source_name, methods)
	end,
	prettier = function (source_name, methods)
		null_ls.register(null_ls.builtins.formatting.prettier)
	end,
})
