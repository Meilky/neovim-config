return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.extra").setup()

			require("mini.ai").setup()

			require("mini.icons").setup({
				style = "ascii",
			})

			require("mini.statusline").setup({ use_icons = true })

			require("mini.git").setup()

			require("mini.diff").setup()

			require("mini.snippets").setup()

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
		end,
	},
}
