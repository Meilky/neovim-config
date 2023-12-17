require("oil").setup({
	default_file_explorer = true,
	columns = {
		"icon",
		"permissions",
		"size",
	},
	view_options = {
		show_hidden = true,
		sort = {
			{ "type", "asc" },
			{ "name", "asc" },
		},
	},
})

vim.keymap.set("n", "<leader>oo", "<cmd>Oil<CR>")
