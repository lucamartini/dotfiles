return {
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
          function()
            local version = vim.version()
            local nvim_version_info = "neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch
            return {
              text = {
                { nvim_version_info, hl = "SnacksDashboardDesc", align = "center" },
              },
            }
          end,
        },
      },
    },
  },
}
