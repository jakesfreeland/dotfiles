function lsp_lang_attach(lang)
	vim.api.nvim_create_autocmd('FileType', {
		pattern = lang.filetypes,
		callback = function()
			client = vim.lsp.get_active_clients({ name = lang.name })[1]
			if client
			then vim.lsp.buf_attach_client(0, client.id)
			else vim.lsp.buf_attach_client(0, vim.lsp.start_client({
				name = lang.name,
				cmd = lang.cmd,
				root = vim.fn.getcwd(),
				capabilities = vim.lsp.protocol.make_client_capabilities()
			}))
			end
		end
	})
end

lsp_lang_attach({
	name = "rust",
	cmd = { "rust-analyzer" },
	filetypes = { "rust" }
})
