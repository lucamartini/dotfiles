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

vim.api.nvim_create_autocmd("WinNew", {
  callback = function()
    vim.cmd("wincmd w")
  end
})

-- vim.g.python3_host_prog = '/Users/lmartini/.pyenv/shims/python3'

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
require("lazy").setup("plugins")

require('mini.icons').setup()

require("tint").setup()

require('legendary').setup({
  extensions = {
    -- to use default settings:
    smart_splits = {},
  },
})

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

require("mason").setup()
require("mason-lspconfig").setup()
-- require("lspconfig").eslint.setup {}
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- ["rust_analyzer"] = function ()
    --    require("rust-tools").setup {}
    -- end
}

require('illuminate').configure({
  -- providers: provider used to get references in the buffer, ordered by priority
  providers = {
      'lsp',
      'treesitter',
  --  'regex',
  },
})
