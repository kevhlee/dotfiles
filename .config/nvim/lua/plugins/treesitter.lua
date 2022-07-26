local present, treesitter = pcall(require, "nvim-treesitter")
if not present then
  return
end

require("nvim-treesitter.configs").setup {
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
