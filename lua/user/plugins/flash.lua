return {
  "folke/flash.nvim",
  event = "VeryLazy",
  config = function()
    require("flash").setup {
      label = {
        style = "inline",
        uppercase = false,
      },
      -- keys = {},
      rainbow = {
        enabled = true,
        -- number between 1 and 9
        shade = 5,
      },
      --
    }
    vim.keymap.set("n", "f", "<nop>")
    vim.keymap.set("n", "F", "<nop>")
  end,
  keys = {
    {
      "s",
      mode = { "x", "o", "n" },
      function() require("flash").jump() end,
      desc = "Flash",
    },
    {
      "R",
      mode = { "x", "o" },
      function() require("flash").treesitter_search() end,
      desc = "Treesitter Search",
    },
    {
      "S",
      mode = { "n" },
      function() require("flash").treesitter() end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = { "o" },
      function() require("flash").remote() end,
      desc = "Remote Flash",
    },
  },
}
