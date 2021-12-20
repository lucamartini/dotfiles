-- show line number
vim.opt.number = true

-- mouse support
vim.opt.mouse = "a"

-- tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.termguicolors = true

vim.cmd [[colorscheme dracula]]
require('gitsigns').setup()
require('lualine').setup({
    options = {
        theme = 'dracula'
    }
})
require('telescope').load_extension('fzf')

local lsp = require "lspconfig"
local coq = require "coq"
lsp.bashls.setup(coq.lsp_ensure_capabilities())
vim.cmd('COQnow -s')

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
	incremental_selection = {
    enable = true,
  },
	indent = {
    enable = true
  }
}
vim.opt.foldmethod='expr'
vim.opt.foldexpr=vim.fn["nvim_treesitter#foldexpr"]()