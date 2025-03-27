vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.smartindent = true
vim.opt.shiftround = true

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.textwidth = 0
vim.opt.scrolloff = 10
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.wrap = false
vim.opt.colorcolumn = "80"

vim.opt.winbar = "%f"
vim.opt.laststatus = 3

vim.opt.mouse = ""

vim.opt.winborder = "rounded"

vim.g.have_nerd_font = false

vim.keymap.set("n", "<A-n>", ":tabnew<CR>")
vim.keymap.set("n", "<A-h>", ":tabprevious<CR>")
vim.keymap.set("n", "<A-l>", ":tabnext<CR>")
vim.keymap.set("n", "<A-t>", ":tabnew<CR>:term<CR>")
vim.keymap.set("n", "<A-H>", ":tabmove -<CR>")
vim.keymap.set("n", "<A-L>", ":tabmove +<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

require("config.lazy")
