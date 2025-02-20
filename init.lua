vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.textwidth = 0
vim.opt.scrolloff = 10
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.colorcolumn = "80"

vim.opt.signcolumn = "yes"
vim.opt.winbar = "%f"
vim.opt.laststatus = 3

vim.keymap.set("n", "<A-n>", ":tabnew<CR>")
vim.keymap.set("n", "<A-h>", ":tabprevious<CR>")
vim.keymap.set("n", "<A-l>", ":tabnext<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

require("config.lazy")
