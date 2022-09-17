-- Globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.completeopt = "menuone,noselect"
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.undofile = true
vim.opt.wrap = false

-- Key mappings
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>")
