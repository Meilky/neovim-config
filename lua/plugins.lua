return require('packer').startup(function(use)
	-- Packer
	use { 'wbthomason/packer.nvim' }

	-- Utils
	use { 'nvim-lua/plenary.nvim' }

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

	-- Installer
	use { "williamboman/mason.nvim" }

	-- Require ["williamboman/mason.nvim"]
	-- Bridge mason/lspconfig
	use { "williamboman/mason-lspconfig.nvim" }

	-- Completion
	use { "hrsh7th/nvim-cmp" }
	use { "hrsh7th/cmp-nvim-lsp" }

	-- Require ["nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons"]
	-- Telescope
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
end)
