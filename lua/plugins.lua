vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer
	use({ 'wbthomason/packer.nvim' })

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{ 'williamboman/mason.nvim' }, -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' }, -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	}

	-- Utils
	use({ 'nvim-lua/plenary.nvim' })
	use({ "norcalli/nvim-colorizer.lua" })

	-- Git signs
	use({ 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' })
	use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })
	use({ 'lewis6991/gitsigns.nvim' })

	-- Theme
	use({
		'folke/tokyonight.nvim',
		config = function()
			vim.cmd("set termguicolors")
			vim.cmd("colorscheme tokyonight-storm")
		end
	})

	-- Icons
	use({ 'nvim-tree/nvim-web-devicons' })

	-- Tressiter
	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

	-- Null-ls
	use { "jose-elias-alvarez/null-ls.nvim" }

	-- Require ["williamboman/mason.nvim"]
	-- Bridge mason/null-ls
	use({ "jayp0521/mason-null-ls.nvim" })

	-- Line
	use({ 'ojroques/nvim-hardline' })

	-- Require ["nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons"]
	-- Telescope
	use({ 'nvim-telescope/telescope.nvim', tag = '0.1.x' })
end)
