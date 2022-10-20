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

	-- Require ["nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons"]
	-- Telescope
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', config = function() require("config.telescope") end }

end)
