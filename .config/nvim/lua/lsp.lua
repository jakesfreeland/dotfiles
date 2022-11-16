function lsp_lang_attach(lang)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = lang.filetypes,
		callback = function()
			client = vim.lsp.get_active_clients({ name = lang.name })[1]
			if client
			then vim.lsp.buf_attach_client(0, client.id)
			else vim.lsp.buf_attach_client(0, vim.lsp.start_client({
				name = lang.name,
				cmd = lang.cmd,
				root_dir = vim.fs.dirname(
				    vim.fs.find(lang.root_pattern, { upward = true })[1])
			}))
			end
		end
	})
end

function lsp_lang_keys(set_keys)
	vim.api.nvim_create_autocmd("LspAttach", { callback = set_keys })
end

--- CONFIG ---

-- languages
lsp_lang_attach({
	name = "rust",
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_pattern = { "Cargo.toml", "rust-project.json" }
})

-- keybinds
lsp_lang_keys(function()
	vim.keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
	vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
end)
