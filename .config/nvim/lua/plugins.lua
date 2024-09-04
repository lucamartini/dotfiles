return {
  {
    "dracula/vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme dracula]])
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'dracula'
        }
      }
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  { "neovim/nvim-lspconfig" },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  },
  { 'echasnovski/mini.icons', 
    version = false 
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    'mrjones2014/legendary.nvim',
    priority = 10000,
    lazy = false,
  },
  { 'mrjones2014/smart-splits.nvim' },
  { 'RRethy/vim-illuminate' },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  },
  { 'levouh/tint.nvim' }
}

