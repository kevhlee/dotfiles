-- TODO: Make it easier to change themes

--=====================================================================
-- Catppuccin
--=====================================================================

-- vim.g.catppuccin_flavour = "frappe"  -- latte, frappe, macchiato, mocha

-- require("catppuccin").setup {
--  transparent_background = true,
-- 	term_colors = true,
-- 	styles = {
-- 		comments = { "italic" },
-- 		conditionals = { "italic" },
-- 		loops = {},
-- 		functions = {},
-- 		keywords = { "bold" },
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

-- vim.cmd [[ colorscheme catppuccin ]]

--=====================================================================
-- Ayu
--=====================================================================

-- vim.api.nvim_create_autocmd('ColorScheme', {
--   group = vim.api.nvim_create_augroup('highlight_cmds', { clear = true }),
--   command = 'hi Normal guibg=NONE ctermbg=NONE',
-- })

-- vim.g.ayucolor="dark" -- light, mirage, dark

-- vim.cmd [[ colorscheme ayu ]]

--=====================================================================
-- Gruvbox
--=====================================================================

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

-- vim.cmd [[ colorscheme gruvbox ]]

--=====================================================================
-- One Dark
--=====================================================================

require("onedark").setup {
  style = 'darker', -- dark, darker, cool, deep, warm, warmer
  transparent = true,
  term_colors = true,
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none',
  },
  colors = {},
  highlights = {},
}

vim.cmd [[ colorscheme onedark ]]
