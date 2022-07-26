local present, gitsigns = pcall(require, "gitsigns")
if not present then
  return
end

gitsigns.setup {
  signs = {
    add          = {hl = "GitSignsAdd"   , text = "│", numhl="GitSignsAddNr"   , linehl="GitSignsAddLn"},
    change       = {hl = "GitSignsChange", text = "│", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn"},
    delete       = {hl = "GitSignsDelete", text = "_", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn"},
    topdelete    = {hl = "GitSignsDelete", text = "‾", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn"},
    changedelete = {hl = "GitSignsChange", text = "~", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn"},
  },
  signcolumn = true,
  watch_gitdir = {
    interval = 500,
    follow_files = true
  },
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> <abbrev_sha> - <summary>",
  max_file_length = 69420,
  preview_config = {
    border = "single",
    style = "minimal",
    relative = "cursor",
  },
}

vim.keymap.set("n", "<leader>hb", function() gitsigns.blame_line{ full = true } end)
vim.keymap.set("n", "<leader>hd", function() gitsigns.diffthis() end)
vim.keymap.set("n", "<leader>hj", function() gitsigns.next_hunk() end)
vim.keymap.set("n", "<leader>hk", function() gitsigns.prev_hunk() end)
vim.keymap.set("n", "<leader>hp", function() gitsigns.preview_hunk() end)
vim.keymap.set("n", "<leader>tb", function() gitsigns.toggle_current_line_blame() end)
