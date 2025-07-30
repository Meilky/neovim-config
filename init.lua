vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.colorcolumn = "80"
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.winbar = "%f"
vim.o.laststatus = 3
vim.o.mouse = ""
vim.o.winborder = "rounded"
vim.g.mapleader = " "

vim.keymap.set("n", "<A-n>", ":tabnew<CR>")
vim.keymap.set("n", "<A-t>", ":tabnew<CR>:term<CR>i")
vim.keymap.set("n", "<A-h>", ":tabprevious<CR>")
vim.keymap.set("n", "<A-l>", ":tabnext<CR>")
vim.keymap.set("n", "<A-H>", ":tabmove -<CR>")
vim.keymap.set("n", "<A-L>", ":tabmove +<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/echasnovski/mini.surround" },
	{ src = "https://github.com/echasnovski/mini.completion" },
	{ src = "https://github.com/echasnovski/mini.icons" },
	{ src = "https://github.com/echasnovski/mini.ai" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/folke/tokyonight.nvim" }
})

vim.cmd("colorscheme tokyonight-night")

require("oil").setup()
vim.keymap.set("n", "<leader>o", ":Oil<CR>")
vim.keymap.set("n", "<A-o>", ":tabnew<CR>:Oil<CR>")

require('mini.surround').setup()
require('mini.completion').setup()
require("mini.ai").setup({
	search_method = "cover",
})
require("mini.icons").setup({
	style = "ascii",
})
require("mini.pick").setup()
vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")
vim.keymap.set("n", "<leader>fb", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>fg", ":Pick grep<CR>")

require("mason").setup()
require("mason-lspconfig").setup()

require("nvim-treesitter").setup({
	highlight = { enable = true },
	indent = { enable = true },
	auto_install = true
})

vim.keymap.set("n", "<leader>FF", vim.lsp.buf.format)
