vim.g.mapleader = " "

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>ws", "<cmd>split<CR>")
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<leader>wh", "<C-W>h")
vim.keymap.set("n", "<leader>wj", "<C-W>j")
vim.keymap.set("n", "<leader>wk", "<C-W>k")
vim.keymap.set("n", "<leader>wl", "<C-W>l")

vim.keymap.set("n", "<leader>cc", "<cmd>botright copen<CR>")
vim.keymap.set("n", "<leader>cq", "<cmd>cclose<CR>")
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<CR>")
vim.keymap.set("n", "<leader>cp", "<cmd>cprev<CR>")
