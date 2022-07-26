vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
vim.keymap.set("n", "<C-z>", "<cmd>w<cr>")

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>")
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")
vim.keymap.set("n", "<leader>gl", "<cmd>Telescope git_commits<cr>")
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")

-- NvimTree
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>")
