vim.g.ayucolor = 'dark'

vim.api.nvim_create_autocmd('ColorScheme', {
	group = vim.api.nvim_create_augroup('highlight_cmds', { clear = true }),
	command = 'hi Normal guibg=NONE ctermbg=NONE',
})

-- vim.cmd [[ colorscheme ayu ]]
-- vim.cmd [[ colorscheme doom-one ]]
-- vim.cmd [[ colorscheme gruvbox ]]
-- vim.cmd [[ colorscheme onedark ]]
vim.cmd [[ colorscheme tomorrow-night ]]
-- vim.cmd [[ colorscheme tomorrow-night-eighties ]]
