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
