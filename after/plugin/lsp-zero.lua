local lsp = require('lsp-zero').preset({
	name = 'minimal',
	set_lsp_keymaps = false,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})
-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.configure("tsserver", {
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "<leader>gg", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>df", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ga", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>fr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>fi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "<leader>FF", function() vim.lsp.buf.format() end, opts)
	vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
