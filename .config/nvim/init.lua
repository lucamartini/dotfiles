-- show line number
vim.opt.number = true

-- mouse support
vim.opt.mouse = "a"

-- tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.termguicolors = true

vim.cmd[[colorscheme dracula]]
require('gitsigns').setup()
require('lualine').setup({
	options = {
		theme = 'dracula'
	}
})
require('telescope').load_extension('fzf')



