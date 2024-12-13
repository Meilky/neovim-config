function _G.get_oil_winbar()
	local dir = require("oil").get_current_dir()
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		-- If there is no current directory (e.g. over ssh), just show the buffer name
		return vim.api.nvim_buf_get_name(0)
	end
end

return {
	{ 
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				win_options = {
					winbar = "%!v:lua.get_oil_winbar()",
				},
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
		end
	}
}
