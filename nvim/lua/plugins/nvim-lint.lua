return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Configure linters by filetype
		lint.linters_by_ft = {
			javascript = { "biomejs" },
			typescript = { "biomejs" },
			javascriptreact = { "biomejs" },
			typescriptreact = { "biomejs" },
		}

		-- Trigger linting
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})

		-- Add Biome auto-fix on save via LSP code actions
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if not client then
					return
				end

				if client.name == "biome" then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("BiomeFixAll", { clear = true }),
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.code_action({
								context = {
									only = { "source.fixAll.biome" },
									diagnostics = {},
								},
								apply = true,
							})
						end,
					})
				end
			end,
		})
	end,
}
