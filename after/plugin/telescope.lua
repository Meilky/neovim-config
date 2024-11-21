require('telescope').setup({
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

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
