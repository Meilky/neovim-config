require("rest-nvim").setup({
	result = {
		show_curl_command = true,
		show_statistics = { "time_pretransfer", "time_starttransfer", "time_total" },
	}
})

vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim")
vim.keymap.set("n", "<leader>rp", "<Plug>RestNvimPreview")
