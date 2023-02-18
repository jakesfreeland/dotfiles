--[[
	SPDX-License-Identifier: BSD-2-Clause
	Copyright (c) 2022, Jake Freeland <jfree@freebsd.org>
	Contents: Minimal Neovim Language Server Protocol (LSP) interface
]]--

function lsp_lang_init(lang)
	vim.api.nvim_create_user_command("Enable" .. lang.name .. "LSP",
	    function() lsp_lang_attach(lang) end, {})
	vim.api.nvim_create_user_command("Disable" .. lang.name .. "LSP",
	    function() lsp_lang_detach(lang.name) end, {})
	if lang.auto_attach
		then vim.api.nvim_create_autocmd("FileType", {
			pattern = lang.filetypes,
			callback = function() lsp_lang_attach(lang) end
		})
	end
end

function lsp_lang_attach(lang)
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

function lsp_lang_detach(lang_name)
	vim.lsp.stop_client(vim.lsp.get_active_clients({ name = lang_name }))
end

function lsp_lang_keys(set_keys)
	vim.api.nvim_create_autocmd("LspAttach", { callback = set_keys })
end

--- CONFIG ---

-- languages
lsp_lang_init({
	name = "rust",
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_pattern = { "Cargo.toml", "rust-project.json" },
	auto_attach = true
})

lsp_lang_init({
	name = "clangd",
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_pattern = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git"
	},
	auto_attach = false
})

-- keybinds
lsp_lang_keys(function()
	vim.keymap.set({ 'n', 'i' }, "<C-h>",
	    "<cmd>lua vim.lsp.buf.signature_help()<cr>")
	vim.keymap.set('n', "<C-k>",
	    "<cmd>lua vim.lsp.buf.hover()<cr>")
	vim.keymap.set('n', "gd",
	    "<cmd>lua vim.lsp.buf.definition()<cr>")
	vim.keymap.set('n', "gD",
	    "<cmd>tab split | lua vim.lsp.buf.definition()<cr>")
	vim.keymap.set('n', "gr",
	    "<cmd>lua vim.lsp.buf.references()<cr>")
end)
