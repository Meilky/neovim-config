local neogit = require("neogit")

neogit.setup({
	disable_signs = false,
	disable_hint = false,
	disable_context_highlighting = false,
	disable_commit_confirmation = false,
	auto_refresh = true,
	disable_builtin_notifications = false,
	use_magit_keybindings = false,
	-- Change the default way of opening neogit
	kind = "split",
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
