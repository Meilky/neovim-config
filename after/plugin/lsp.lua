local lsp = require('lsp-zero').preset('recommended')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local lspsaga = require("lspsaga")

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = "luasnip" }
	}, {
		{ name = 'buffer' },
		{
			name = 'latex_symbols',
			{
				strategy = 2,
			}
		},
		{ name = "path" },
	}),
	mapping = {
		['<Tab>'] = cmp_action.luasnip_jump_forward(),
		['<S-Tab>'] = cmp_action.luasnip_jump_backward(),
		['<C-j>'] = cmp.mapping.scroll_docs(4),
		['<C-k>'] = cmp.mapping.scroll_docs(-4),
		['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-space>'] = cmp_action.toggle_completion(),
	},
})

cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)

lsp.preset({ name = 'minimal' })


lsp.set_sign_icons({
	error = 'E',
	warn = 'W',
	hint = 'H',
	info = 'I'
});

lsp.configure('tsserver', {
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })

	local opts = { buffer = bufnr }

	vim.keymap.set("n", "<leader>gh", "<cmd>Lspsaga finder<CR>", opts)
	vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>", opts)
	vim.keymap.set("n", "<leader>gp", "<cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set({ "n", "v" }, "<leader>ga", "<cmd>Lspsaga code_action<CR>", opts)
	vim.keymap.set("n", "<leader>gg", "<cmd>Lspsaga hover_doc<CR>", opts)
	vim.keymap.set("n", "<leader>gr", "<cmd>Lspsaga rename<CR>", opts)
	vim.keymap.set("n", "<leader>go", "<cmd>Lspsaga outline<CR>", opts)

	vim.keymap.set("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)
	vim.keymap.set("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)

	vim.keymap.set("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>dd", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>dw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>dc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>dp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	vim.keymap.set("n", "<leader>dn", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

	vim.keymap.set("n", "<leader>FF", function() vim.lsp.buf.format() end, opts)
end)

vim.diagnostic.config({
	virtual_text = false
})

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
		virtual_text = false,
	},
	ui = {
		code_action = "A",
		border = "rounded",
		title = false,
	},
	rename = {
		in_select = false
	}
})
