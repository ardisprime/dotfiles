
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function ()
      vim.g.nightflyCursorColor = true
      vim.g.nightflyTransparent = true
    end
  },
  {
    "scottmckendry/cyberdream.nvim"
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function ()
      vim.g.everforest_background = "hard"
      vim.g.everforest_cursor = "red"
      vim.g.everforest_transparent_background = 2
    end
  },
  {
    "rebelot/kanagawa.nvim",
    config = function ()
      require("kanagawa").setup({
        transparent = true
      })
    end
  }
}

