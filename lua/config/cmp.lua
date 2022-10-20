local cmp = require("cmp")

cmp.setup({
	view = {
		entries = 'custom'
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
	}),
	mapping = cmp.mapping.preset.insert({
		['<C-k>'] = cmp.mapping.scroll_docs(-4),
		['<C-j>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	}),
})
