return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",

	version = "*",

	opts = {
		keymap = { preset = "default" },

		snippets = { preset = "mini_snippets" },

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			list = { selection = { preselect = false, auto_insert = true } },
			menu = {
				draw = {
					components = {
						kind_icon = {
							ellipsis = false,
							text = function(ctx)
								local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								return kind_icon
							end,
							-- Optionally, you may also use the highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
					},
				},
			},
			ghost_text = { enabled = true },
		},

		signature = { enabled = true },
	},
}
