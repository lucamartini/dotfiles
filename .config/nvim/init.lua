-- hightlight cursor
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- mouse support
vim.opt.mouse = "a"

-- tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.termguicolors = true

vim.opt.wildmode = "longest:full,full"

vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

vim.g.python3_host_prog = '~/.pyenv/versions/nvim-env/bin/python'

vim.api.nvim_create_autocmd("WinNew", {
  callback = function()
    vim.cmd("wincmd w")
  end
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.diagnostic.config({
  virtual_text = true, -- inline text on the right
  signs = true,        -- symbols in the gutter
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

require("lazy").setup("plugins")

require('mini.icons').setup()

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

require("mason").setup()

require('illuminate').configure({
  -- providers: provider used to get references in the buffer, ordered by priority
  providers = {
    'lsp',
    'treesitter',
    --  'regex',
  },
})

vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)

require('nvim-highlight-colors').setup({})
