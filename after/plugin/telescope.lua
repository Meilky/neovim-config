require('telescope').setup({
	defaults = {
		file_ignore_patterns = { ".git" },
		color_devicons = true,
	},
	pickers = {
		find_files = {
			hidden = true,
			find_command = {
				'rg',
				'--files',
				'--no-require-git',
				'--line-number',
				'--column',
				'--with-filename',
				'--no-heading',
				'--smart-case',
				'--color=never'
			}
		}
	}

})

local builtin = require('telescope.builtin')
local km = require("vim.keymap")

km.set('n', '<leader>ff', builtin.find_files)
km.set('n', '<leader>fg', builtin.live_grep)
km.set('n', '<leader>fb', builtin.buffers)
km.set('n', '<leader>fh', builtin.help_tags)
km.set('n', '<leader>fr', builtin.lsp_references)
