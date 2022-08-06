vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('highlight_cmds', { clear = true }),
  command = 'hi Normal guibg=NONE ctermbg=NONE',
})

-- vim.g.catppuccin_flavour = "frappe"
-- vim.g.catppuccin_flavour = "latte"
-- vim.g.catppuccin_flavour = "macchiato"
-- vim.g.catppuccin_flavour = "mocha"

-- vim.g.tokyonight_style = "night"

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
--     treesitter = {
--       enabled = true,
--     },
--   },
-- }

-- require("gruvbox").setup {
--   undercurl = true,
--   underline = true,
--   bold = true,
--   italic = false,
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "", -- can be "hard", "soft" or empty string
--   overrides = {},
-- }

-- vim.cmd [[ colorscheme atom-dark ]]
vim.cmd [[ colorscheme ayu ]]
-- vim.cmd [[ colorscheme catppuccin ]]
-- vim.cmd [[ colorscheme doom-one ]]
-- vim.cmd [[ colorscheme dracula ]]
-- vim.cmd [[ colorscheme gruvbox ]]
-- vim.cmd [[ colorscheme onedark ]]
-- vim.cmd [[ colorscheme oxocarbon ]]
-- vim.cmd [[ colorscheme panda ]]
-- vim.cmd [[ colorscheme tokyonight ]]
-- vim.cmd [[ colorscheme tomorrow-night ]]
-- vim.cmd [[ colorscheme tomorrow-night-eighties ]]
