local present, mason = pcall(require, "mason")
if not present then
  return
end

mason.setup {
  ensure_installed = {},
  ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ﮊ",
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },
  max_concurrent_installers = 10,
}

local lspconfig_present, mason_lspconfig = pcall(require, "mason-lspconfig")
if not lspconfig_present then
  return
end

mason_lspconfig.setup {
  automatic_installation = true,
}
