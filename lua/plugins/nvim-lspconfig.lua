return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ "williamboman/mason.nvim",           config = function() end },
		{ "williamboman/mason-lspconfig.nvim", config = function() end },
	},
	config = function()
		-- call order matters
		require("mason").setup()
		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({})

		mason_lspconfig.setup_handlers({
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup {
					capabilities = require("cmp_nvim_lsp").default_capabilities()
				}
			end,
			["gopls"] = function()
			end,
			["rust_analyzer"] = function()
			end,
			["harper_ls"] = function()
				require("lspconfig").harper_ls.setup {
					settings = {
						["harper-ls"] = {
							linters = { sentence_capitalization = false }
						}
					}
				}
			end,
		})

		-- go install golang.org/x/tools/gopls@latest
		-- https://cs.opensource.google/go/x/tools/+/refs/tags/gopls/v0.15.3:gopls/doc/vim.md
		require("lspconfig").gopls.setup({
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					gofumpt = true,
				},
			},
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				local params = vim.lsp.util.make_range_params()
				params.context = { only = { "source.organizeImports" } }
				-- buf_request_sync defaults to a 1000ms timeout. Depending on your
				-- machine and codebase, you may want longer. Add an additional
				-- argument after params if you find that you have to write the file
				-- twice for changes to be saved.
				-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
				local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
				for cid, res in pairs(result or {}) do
					for _, r in pairs(res.result or {}) do
						if r.edit then
							local enc = (vim.lsp.get_client_by_id(cid) or {})
							.offset_encoding or "utf-16"
							vim.lsp.util.apply_workspace_edit(r.edit, enc)
						end
					end
				end
				vim.lsp.buf.format({ async = false })
			end
		})

		-- https://rust-analyzer.github.io/manual.html#installation
		require("lspconfig").rust_analyzer.setup({
			on_attach = function(client, bufnr)
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			end,
			settings = {
				["rust-analyzer"] = {
					imports = {
						granularity = {
							group = "module",
						},
						prefix = "self",
					},
					cargo = {
						buildScripts = {
							enable = true,
						},
					},
					procMacro = {
						enable = true
					},
				}
			},
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.rs",
			callback = function()
				vim.lsp.buf.format({ async = false })
			end
		})

		-- rename; then C-F to edit in command window
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
		-- format
		vim.keymap.set("n", "<leader>fmt", function()
			vim.lsp.buf.format({ async = false })
		end)
		-- using lsp go to definition
		vim.keymap.set("n", "gD", vim.lsp.buf.definition)

		-- vim.lsp.set_log_level("debug")
	end,
}
