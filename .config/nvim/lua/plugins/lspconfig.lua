local present, lspconfig = pcall(require, "lspconfig")
if not present then
  return
end

-- Set up UI

vim.diagnostic.config {
  virtual_text = {
    prefix = "",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  width = 90,
  border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
  focusable = false,
  relative = "cursor",
})

-- Set up LSP servers

local on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  -- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
  -- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

  local function buf_set_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true })
  end

  buf_set_keymap("n", "K", vim.lsp.buf.hover)
  buf_set_keymap("n", "<C-k>", vim.lsp.buf.signature_help)
  buf_set_keymap("n", "<leader>gD", vim.lsp.buf.declaration)
  buf_set_keymap("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>")
  buf_set_keymap("n", "<leader>gi", "<cmd>Telescope lsp_implementations")
  buf_set_keymap("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>")
  buf_set_keymap("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<cr>")
  buf_set_keymap("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<cr>")
  buf_set_keymap("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>")
  buf_set_keymap("n", "<leader>dj", vim.lsp.diagnostic.goto_next)
  buf_set_keymap("n", "<leader>dk", vim.lsp.diagnostic.goto_prev)
  buf_set_keymap("n", "<leader>ca", vim.lsp.buf.code_action)
  buf_set_keymap("n", "<leader>cr", vim.lsp.buf.rename)
  buf_set_keymap("n", "<leader>p", vim.lsp.buf.formatting_sync)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = {
    valueSet = { 1 },
  },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

local default_config_servers = {
  "bashls",
  "cssls",
  "gopls",
  "html",
  "jsonls",
  "marksman",
  "pyright",
  "rust_analyzer",
  "sqlls",
  "tsserver",
  "vimls",
  "yamlls",
}

for _, server in ipairs(default_config_servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "use", "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
