require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", { desc = "format file"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
