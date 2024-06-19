return {
	'neovim/nvim-lspconfig',
	config = function()
		local lspconfig = require('lspconfig')
		-- https://cs.opensource.google/go/x/tools/+/refs/tags/gopls/v0.15.3:gopls/doc/vim.md
		lspconfig.gopls.setup({
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					gofumpt = true,
				},
			},
		})
	end,
}

