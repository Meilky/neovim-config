local lsp = require('lsp-zero').preset({
	name = 'minimal',
	set_lsp_keymaps = false,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.configure("tsserver", {
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end
})

lsp.setup()
