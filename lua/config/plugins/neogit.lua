return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
	config = function()
		require("neogit").setup({})

		vim.keymap.set("n", "<leader>cc", require("neogit").open)
	end,
}
