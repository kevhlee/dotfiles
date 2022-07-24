local servers = {
	'cssls', -- CSS
	'dockerls', -- Docker
	'gopls', -- Go,
	'jsonls', -- JSON
	'html', -- HTML
	'pyright', -- Python
	'sqls', -- SQL
	'sumneko_lua', -- Lua
	'tsserver', -- JavaScript/TypeScript
	'yamlls', -- YAML
}

require('nvim-lsp-installer').setup {
	ensure_installed = servers,
}

local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr }

	-- Mappings
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
	vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions<cr>', opts)
	vim.keymap.set('n', '<leader>gi', '<cmd>Telescope lsp_implementations<cr>', opts)
	vim.keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references<cr>', opts)
	vim.keymap.set('n', '<leader>gt', '<cmd>Telescope lsp_type_definitions<cr>', opts)
	vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, opts)
	vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics<cr>', opts)

	-- Format-on-save
	vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting_seq_sync, {})

	-- if client.resolved_capabilities.document_formatting then
	-- 	vim.api.nvim_command [[ augroup Format ]]
	-- 	vim.api.nvim_command [[ autocmd! * <buffer> ]]
	-- 	vim.api.nvim_command [[ autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync() ]]
	-- 	vim.api.nvim_command [[ augroup END ]]
	-- end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if server == 'sumneko_lua' then
		opts.settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
				},
				diagnostics = {
					globals = { 'use', 'vim' },
					disable = { 'lowercase-global' },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file('', true),
				},
				telemetry = {
					enable = false,
				},
			},
		}
	end

	require('lspconfig')[server].setup(opts)
end

local cmp = require('cmp')
local luasnip = require('luasnip')

if cmp ~= nil then
	cmp.setup {
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert {
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<CR>'] = cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			},
			['<Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { 'i', 's' }),
			['<S-Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { 'i', 's' }),
		},
		sources = {
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = 'buffer' },
		},
	}
end
