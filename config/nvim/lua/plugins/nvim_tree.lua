local present, nvim_tree = pcall(require, "nvim-tree")
if not present then
  return
end

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  open_on_setup = true,
  filters = {
    custom = {
      ".DS_Store",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    adaptive_size = true,
    side = "left",
    width = 30,
    hide_root_folder = false,
  },
  git = {
    enable = true,
    ignore = false,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
    highlight_git = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
}

vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<cr>")
