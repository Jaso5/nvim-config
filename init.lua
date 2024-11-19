


-- Package Manager
require("config.lazy")

-- nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Coc
require("config.coc")

-- File Tree (Open by default)
require("nvim-tree").setup()
vim.cmd("NvimTreeOpen")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function(ev)
		vim.lsp.start({
			name = "c-lsp",
			cmd = {"/home/jaso/code/lsp/c-lsp/run.sh"},
			root_dir = vim.fs.root(ev.buf, {'src', 'examples'}),
			trace = "messages"
		})
	end,
})

-- local lspconfig = require('lspconfig')

-- lspconfig.c_lsp.setup{
--   capabilities = capabilities,
--   cmd = { "/home/jaso/code/lsp/c-lsp/run.sh" },
--   filetypes = {"c"},
--   init_options = {
--     server = {
--       logLevel = "debug"
--     },
--   },
--   on_attach = on_attach,
-- }
