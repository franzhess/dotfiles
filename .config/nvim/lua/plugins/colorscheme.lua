-- lua/plugins/colorscheme.lua
return {
  -- add nord.nvim
  {
    "shaunsingh/nord.nvim",
    lazy = false, -- Load immediately
    priority = 1000, -- Load before other plugins
    config = function()
      -- Optional: configure nord
      -- vim.g.nord_contrast = true
      -- vim.g.nord_disable_background = false
    end,
  },

  -- Configure LazyVim to load nord
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
