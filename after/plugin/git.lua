local neogit = require("neogit")

neogit.setup({
	disable_commit_confirmation = true,
	auto_refresh = true,
	kind = "vsplit",
	signs = {
		-- { CLOSED, OPENED }
		section = { ">", "v" },
		item = { ">", "v" },
		hunk = { "", "" },
	},
	integrations = {
		diffview = true
	},
})

vim.keymap.set('n', '<leader>cc', neogit.open)
