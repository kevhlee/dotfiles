local present, telescope = pcall(require, "telescope")
if not present then
  return
end

telescope.setup {
  defaults = {
    prompt_prefix = "🔭 ",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    mappings = {
      n = {
        ["q"] = require("telescope.actions").close,
      },
    },
    file_ignore_patterns = {
      "*.iml",
      ".DS_Store",
      "^.git/",
      "^.idea/",
      "^node_modules/",
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      hidden = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

telescope.load_extension("fzf")

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>")
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")
vim.keymap.set("n", "<leader>gl", "<cmd>Telescope git_commits<cr>")
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
