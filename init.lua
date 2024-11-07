


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

-- empty setup using defaults
require("nvim-tree").setup()
vim.cmd("NvimTreeOpen")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function(ev)
		vim.lsp.start({
			name = "c-lsp",
			cmd = {"/home/jaso/code/lsp/c-lsp/run.sh"},
			root_dir = vim.fs.root(ev.buf, {'src', 'examples'})
		})
	end,
})
