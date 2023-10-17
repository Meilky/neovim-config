require('nvim-treesitter.configs').setup({
	ensure_installed = { "vim", "lua", "regex", "vimdoc", "markdown", "markdown_inline", "http", "json" },
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true
	}
})
