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

require("config.lazy")
