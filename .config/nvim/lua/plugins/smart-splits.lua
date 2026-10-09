return {
  {
    "smart-splits-nvim/smart-splits.nvim",
    version = '^3.0.0',
    dependencies = {
      { 'smart-splits-nvim/backend-tmux', main = 'smart-splits-backend-tmux' },
    },
    opts = {
      mux = { backend = 'smart-splits-backend-tmux' },
      move = {
        at_edge = 'stop'
      }
    },
  }
}
