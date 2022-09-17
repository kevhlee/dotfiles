local present, toggleterm = pcall(require, "toggleterm")
if not present then
  return
end

toggleterm.setup {
  direction = "horizontal",
  size = 25,
  open_mapping = [[<C-\>]],
  insert_mappings = true,
  auto_scroll = true,
  close_on_exit = true,
}
