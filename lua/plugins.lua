return require('packer').startup(function(use)
	-- Packer
	use { 'wbthomason/packer.nvim' }

	-- Utils
	use { 'nvim-lua/plenary.nvim' }
	use { "norcalli/nvim-colorizer.lua" }

	-- Theme
	use { 'folke/tokyonight.nvim' }

	-- Lsp config
	use { 'neovim/nvim-lspconfig' }

	-- Icons
	use { 'nvim-tree/nvim-web-devicons' }

	-- Tressiter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Git signs
	use { 'lewis6991/gitsigns.nvim' }

	-- Buffer delete
	use { 'ojroques/nvim-bufdel' }

	-- Mason
	use { "williamboman/mason.nvim" }

	-- Null-ls
	use { "jose-elias-alvarez/null-ls.nvim" }

	-- Require ["williamboman/mason.nvim"]
	-- Bridge mason/lspconfig
	use { "williamboman/mason-lspconfig.nvim" }

	-- Require ["williamboman/mason.nvim"]
	-- Bridge mason/null-ls
	use { "jayp0521/mason-null-ls.nvim" }

	-- Completion
	use { "hrsh7th/nvim-cmp" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-path" }
	use { "saadparwaiz1/cmp_luasnip"}

	-- Line
	use { 'ojroques/nvim-hardline' }

	-- Snippets
	use {"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"}
	use { "rafamadriz/friendly-snippets" }

	-- Require ["nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons"]
	-- Telescope
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
end)
