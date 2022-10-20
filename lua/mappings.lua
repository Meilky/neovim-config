vim.g.mapleader = ";"
vim.g.maplocalleader = ","

local lspbuf = require('vim.lsp.buf')
local km = require("vim.keymap")

km.set("n", "<leader>gg", lspbuf.hover)
km.set("n", "<leader>gr", lspbuf.rename)
km.set("n", "<leader>ga", lspbuf.code_action)
km.set("n", "<leader>fr", lspbuf.references)
km.set("n", "<leader>fd", lspbuf.definition)
km.set("n", "<leader>fi", lspbuf.implementation)
km.set("n", "<leader>FF", lspbuf.format)

km.set("n", "<leader>ws", "<cmd>split<CR>")
km.set("n", "<leader>wv", "<cmd>vsplit<CR>")
km.set("n", "<leader>wh", "<C-W>h")
km.set("n", "<leader>wj", "<C-W>j")
km.set("n", "<leader>wk", "<C-W>k")
km.set("n", "<leader>wl", "<C-W>l")
km.set("n", "<leader>wH", "<cmd>vertical resize +5<CR>")
km.set("n", "<leader>wJ", "<cmd>resize -5<CR>")
km.set("n", "<leader>wK", "<cmd>resize +5<CR>")
km.set("n", "<leader>wL", "<cmd>vertical resize -5<CR>")
km.set("n", "<leader>w-", "<C-W>_")
km.set("n", "<leader>w=", "<C-W>=")
km.set("n", "<leader>wr", "<C-W>R")
km.set("n", "<leader>wtj", "<C-W>t<C-W>K")
km.set("n", "<leader>wtl", "<C-W>t<C-W>H")
