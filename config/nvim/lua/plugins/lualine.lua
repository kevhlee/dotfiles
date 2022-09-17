local present, lualine = pcall(require, "lualine")
if not present then
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
}
