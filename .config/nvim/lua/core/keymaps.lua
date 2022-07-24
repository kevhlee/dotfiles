vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fj', '<cmd>Telescope jumplist<cr>')
vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope commands<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope file_browser<cr>', { noremap = true })
