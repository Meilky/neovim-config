require('mini.icons').setup({
	style = 'ascii',
})

require('mini.statusline').setup()

require('mini.git').setup()

require('mini.diff').setup()

require('mini.comment').setup()

require('mini.completion').setup()

require('mini.fuzzy').setup()

require('mini.hipatterns').setup({
	highlighters = {
		hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
	}
})
