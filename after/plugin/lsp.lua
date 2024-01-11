local lsp_zero = require('lsp-zero').preset('recommended')
local null_ls = require("null-ls")
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = require('lsp-zero').cmp_format()

require('luasnip.loaders.from_vscode').lazy_load()

vim.opt.updatetime = 350;

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
	},
})

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.highlight_symbol(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })

	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { buffer = bufnr })
end)

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf, lsp_fallback = true })
	end,
})

vim.diagnostic.config({
	virtual_text = false
})

require('mason').setup({})
require('mason-lspconfig').setup({
	handlers = {
		lsp_zero.default_setup,
	}
})

cmp.setup({
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = 'nvim_lsp' },
		{ name = "luasnip",       keyword_length = 2 },
		{ name = 'buffer',        keyword_length = 3 },
		{ name = 'latex_symbols', { strategy = 2 } },
	}),
	formatting = cmp_format,
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = false }),
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
	handlers = {},
})
