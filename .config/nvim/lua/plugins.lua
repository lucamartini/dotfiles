return {
  {
    "dracula/vim",
    lazy = false,
    priority = 1000,
    config = function ()
      vim.cmd([[colorscheme dracula]])
    end,
  },
  {
    "lewis6991/gitsigns.nvim", 
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function() 
      require('gitsigns').setup() 
    end
  },
  {
    "nvim-lualine/lualine.nvim", 
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = function()
      require('lualine').setup{
        options = {
          theme = 'dracula'
        }
      }
    end
  },
  {
    "nvim-telescope/telescope.nvim", 
    dependencies = {"nvim-lua/plenary.nvim"}
  },
  {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate"
  },
  "neovim/nvim-lspconfig",
  {
    "nvim-telescope/telescope-fzf-native.nvim", 
    build = "make"
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }
}

