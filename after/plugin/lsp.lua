local lsp_zero = require('lsp-zero').preset('recommended')
local null_ls = require("null-ls")
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr }

	local tb = require('telescope.builtin')

	vim.keymap.set({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>gg", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>FF", vim.lsp.buf.format, opts)
	vim.keymap.set("n", "<leader>gR", tb.lsp_references, opts)
	vim.keymap.set("n", "<leader>dd", tb.diagnostics, opts)
	vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>gd", tb.lsp_definitions, opts)
end)

vim.diagnostic.config({
	virtual_text = false
})

require('mason').setup({})
require('mason-lspconfig').setup({
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	}
})

cmp.setup({
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
	formatting = {
		fields = { 'abbr', 'kind', 'menu' },
		format = require('lspkind').cmp_format({
			mode = 'symbol_text',
			maxwidth = 50,
			ellipsis_char = '...',
		})
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-j>'] = cmp.mapping.scroll_docs(4),
		['<C-k>'] = cmp.mapping.scroll_docs(-4),
		['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
		['<C-Space>'] = cmp_action.toggle_completion(),
		['<Tab>'] = cmp_action.luasnip_jump_forward(),
		['<S-Tab>'] = cmp_action.luasnip_jump_backward(),
	}),
})

lsp_zero.set_sign_icons({
	error = 'E',
	warn = 'W',
	hint = 'H',
	info = 'I'
});


null_ls.setup()

require("mason-null-ls").setup({
	handlers = {
		prettier = function(source_name, methods)
			null_ls.register(null_ls.builtins.formatting.prettier)
		end,
		eslint = function(source_name, methods)
			null_ls.register(null_ls.builtins.code_actions.eslint)
			null_ls.register(null_ls.builtins.diagnostics.eslint)
		end,
	}
})
