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

	vim.keymap.set("n", "<leader>gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
	vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>", opts)
	vim.keymap.set("n", "<leader>gp", "<cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set({ "n", "v" }, "<leader>ga", "<cmd>Lspsaga code_action<CR>", opts)
	vim.keymap.set("n", "<leader>gg", "<cmd>Lspsaga hover_doc<CR>", opts)
	vim.keymap.set("n", "<leader>gr", "<cmd>Lspsaga rename ++project<CR>", opts)
	vim.keymap.set("n", "<leader>go", "<cmd>Lspsaga outline<CR>", opts)

	vim.keymap.set("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>dd", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>dw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>dn", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	vim.keymap.set("n", "<leader>dp", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

	vim.keymap.set("n", "<leader>FF", function() vim.lsp.buf.format() end, opts)

	vim.diagnostic.config({
		virtual_text = false
	})
end)

lsp.setup()

require("lspsaga").setup({
	preview = {
		lines_above = 2,
		lines_below = 10,
	},
	scroll_preview = {
		scroll_down = "<C-j>",
		scroll_up = "<C-k>",
	},
	lightbulb = {
		enable = true,
		enable_in_insert = true,
		sign = true,
		sign_priority = 40,
		virtual_text = false,
	},
	ui = {
		code_action = "A",
		border = "rounded",
		expand = ">",
		collapse = "v",
		title = false,
	},
})
