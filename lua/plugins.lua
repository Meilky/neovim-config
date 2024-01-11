require('lazy').setup({
	{ 'nvim-lua/plenary.nvim' },
	{ 'nvim-tree/nvim-web-devicons' },
	{ "norcalli/nvim-colorizer.lua" },

	{ 'folke/tokyonight.nvim' },

	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			'neovim/nvim-lspconfig',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			"kdheepak/cmp-latex-symbols",

			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets',
			'onsails/lspkind.nvim'
		},
		branch = 'v3.x'
	},

	{
		'lewis6991/gitsigns.nvim',
		opts = {
			signcolumn = true,
			numhl      = false,
			linehl     = false,
			word_diff  = false,
		}
	},
	-- Tressiter
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

	-- Null-ls
	{ "nvimtools/none-ls.nvim",          dependencies = { 'nvim-lua/plenary.nvim' } },

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim"
		},
	},

	-- Line
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
		branch = '0.1.x'
	},

	{
		'stevearc/oil.nvim',
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{ 'kevinhwang91/nvim-bqf' },

	{ "rest-nvim/rest.nvim",       dependencies = { { "nvim-lua/plenary.nvim" } } },

	{ 'stevearc/conform.nvim' }
})
