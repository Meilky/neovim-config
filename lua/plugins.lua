require('lazy').setup({
	{ 'nvim-lua/plenary.nvim' },

	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	{"neovim/nvim-lspconfig"},

	{ 'folke/tokyonight.nvim' },

	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x' },

	{ 'stevearc/oil.nvim' },

	{ 'kevinhwang91/nvim-bqf' },

	{ 'echasnovski/mini.nvim', version = false },
})
