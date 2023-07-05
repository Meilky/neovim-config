require('telescope').setup({
	ensure_installed = { "vim", "lua", "vim", "vimdoc", "markdown", "markdown_inline" },

	defaults = {
		color_devicons = true,
	},
	pickers = {
		find_files = {
			hidden = true,
			find_command = {
				"rg",
				"--files",
				"--hidden",
				"--line-number",
				"--column",
				"--with-filename",
				"--no-heading",
				"--smart-case",
				"--color=never",
				"--ignore-file",
				".gitignore",
				"--glob",
				"!**/.git/*",
			},
		}
	}
})

local builtin = require('telescope.builtin')
local km = require("vim.keymap")

km.set('n', '<leader>ff', builtin.find_files)
km.set('n', '<leader>fg', builtin.live_grep)
km.set('n', '<leader>fb', builtin.buffers)
