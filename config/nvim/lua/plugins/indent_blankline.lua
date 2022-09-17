local present, indent_blankline = pcall(require, "indent_blankline")
if not present then
  return
end

indent_blankline.setup {
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = false,
  char = "▏",
  context_char = "▏",
}
