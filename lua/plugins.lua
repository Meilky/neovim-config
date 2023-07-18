require('lazy').setup({
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
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lua',

			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets',
			'onsails/lspkind.nvim'
		}
	},

	{ 'nvim-lua/plenary.nvim' },
	{ "norcalli/nvim-colorizer.lua" },

	-- Git signs
	{ 'NeogitOrg/neogit',           dependencies = { 'nvim-lua/plenary.nvim' } },
	{ 'sindrets/diffview.nvim',     dependencies = { 'nvim-tree/nvim-web-devicons' } },
	{ 'lewis6991/gitsigns.nvim' },

	-- Theme
	{
		'folke/tokyonight.nvim',
		config = function()
			vim.cmd("set termguicolors")
			vim.cmd("colorscheme tokyonight-storm")
		end
	},

	-- Icons
	{ 'nvim-tree/nvim-web-devicons' },

	-- Tressiter
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

	-- Null-ls
	{ "jose-elias-alvarez/null-ls.nvim", dependencies = { 'nvim-lua/plenary.nvim' } },

	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},

	-- Line
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
	{ 'ojroques/nvim-hardline' },

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
		tag = '0.1.1'
	},

	{ 'mbbill/undotree' },

	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" }
		}
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {
			modes = {
				char = {
					enabled = false
				}
			}
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash"
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter"
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash"
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search"
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search"
			},
		},
	}
})
