return {
  "RRethy/nvim-treesitter-endwise",
  event = "VeryLazy",
  enabled = false,
  config = function()
    require("nvim-treesitter.configs").setup {
      endwise = {
        enable = true,
      },
    }
  end,
}
