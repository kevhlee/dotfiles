vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('highlight_cmds', { clear = true }),
  command = 'hi Normal guibg=NONE ctermbg=NONE',
})

-- vim.g.catppuccin_flavour = "frappe"
-- vim.g.catppuccin_flavour = "latte"
-- vim.g.catppuccin_flavour = "macchiato"
-- vim.g.catppuccin_flavour = "mocha"

-- require("catppuccin").setup {
--   transparent_background = true,
-- 	term_colors = true,
-- 	styles = {
-- 		comments = { "italic" },
-- 		conditionals = { "italic" },
-- 		loops = {},
-- 		functions = {},
-- 		keywords = {},
-- 		strings = {},
-- 		variables = {},
-- 		numbers = {},
-- 		booleans = {},
-- 		properties = {},
-- 		types = {},
-- 		operators = {},
-- 	},
--   integrations = {
--     nvimtree = {
--       enabled = true,
--       transparent_panel = true,
--     },
--   },
-- }

-- vim.cmd [[ colorscheme catppuccin ]]
-- vim.cmd [[ colorscheme doom-one ]]
-- vim.cmd [[ colorscheme dracula ]]
-- vim.cmd [[ colorscheme gruvbox ]]
vim.cmd [[ colorscheme onedark ]]
-- vim.cmd [[ colorscheme tomorrow-night ]]
-- vim.cmd [[ colorscheme tomorrow-night-eighties ]]
