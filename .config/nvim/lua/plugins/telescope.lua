require('telescope').setup {
	defaults = {
		file_ignore_patterns = {
			'*.iml',
			'^.git/',
			'^.idea/',
			'^node_modules/',
		},
	},
	pickers = {
		find_files = {
			theme = 'ivy',
			hidden = true,
		},
	},
	extensions = {
		file_browser = {
			theme = 'ivy',
			hidden = true,
			hijack_netrw = true,
		},
		['ui-select'] = {
			require('telescope.themes').get_cursor()
		},
	},
}

require('telescope').load_extension('file_browser')
require("telescope").load_extension("ui-select")
