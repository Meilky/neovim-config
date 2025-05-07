return {
	{
		"echasnovski/mini.nvim",
		dependencies = "rafamadriz/friendly-snippets",
		version = false,
		config = function()
			require("mini.extra").setup()

			require("mini.ai").setup({
				search_method = "cover",
			})

			require("mini.icons").setup({
				style = "ascii",
			})

			require("mini.statusline").setup({ use_icons = true })

			require("mini.git").setup()

			require("mini.diff").setup()

			local gen_loader = require("mini.snippets").gen_loader
			require("mini.snippets").setup({
				snippets = {
					-- Load custom file with global snippets first (adjust for Windows)
					gen_loader.from_file("~/.config/nvim/snippets/global.json"),

					-- Load snippets based on current language by reading files from
					-- "snippets/" subdirectories from 'runtimepath' directories.
					gen_loader.from_lang(),
				},
			})

			require("mini.fuzzy").setup()

			local hi_words = require("mini.extra").gen_highlighter.words
			require("mini.hipatterns").setup({
				highlighters = {
					fixme = hi_words({ "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
					hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
					todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
					note = hi_words({ "NOTE", "Note", "note" }, "MiniHipatternsNote"),

					hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
				},
			})

			require("mini.surround").setup()

			require("mini.completion").setup()
		end,
	},
}
