local lsp = require('lsp-zero').preset('recommended')
local cmp_action = require('lsp-zero').cmp_action()
local cmp = require('cmp')

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		['<Tab>'] = cmp_action.luasnip_supertab(),
		['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
		['<C-j>'] = cmp.mapping.scroll_docs(4),
		['<C-k>'] = cmp.mapping.scroll_docs(-4),
		['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		['<C-e>'] = cmp.mapping.abort(),
	},
})

lsp.set_preferences({
	set_lsp_keymaps = false,
	float_border = "rounded",
	manage_nvim_cmp = {
		set_sources = 'recommended',
	}
})


lsp.set_sign_icons({
	error = 'E',
	warn = 'W',
	hint = 'H',
	info = 'I'
});

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require("lspconfig").tsserver.setup({
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "<leader>gD", function() vim.lsp.buf.declaration() end, opts)
	vim.keymap.set("n", "<leader>gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "<leader>ga", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>gg", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<leader>gR", function() vim.lsp.buf.references() end, opts)

	vim.keymap.set("n", "<leader>dd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)

	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

	vim.keymap.set("n", "<leader>FF", function() vim.lsp.buf.format() end, opts)
end)

lsp.setup()
