local lsp_zero = require('lsp-zero')

lsp_zero.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'clangd'},
	handlers = {
		lsp_zero.default_setup,
	},
})

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
	vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set('n', 'gt', function() vim.lsp.buf.type_definition() end, opts)
	vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
	vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
end)

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp_zero.defaults.cmp_mappings ({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-Tab>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-Enter>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp_zero.set_sign_icons({
	error = '',
	warn = '',
	hint = '󱧢',
	info = ''
})

lsp_zero.setup()
