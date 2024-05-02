return {
  "mizlan/delimited.nvim",
  event = "VeryLazy",
  config = function()
    require("delimited").setup({})
  end,
  keys = {

    {
      "]d",
      function() require("delimited").goto_next() end,
      desc = "Next diagnostic",
    },
    {
      "[d",
      function() require("delimited").goto_prev() end,
      desc = "Prev diagnostic",
    },
    {
      "]D",
      function() require("delimited").goto_next { severity = vim.diagnostic.severity.ERROR } end,
      desc = "Next Error",
    },
    {
      "[D",
      function() require("delimited").goto_prev { severity = vim.diagnostic.severity.ERROR } end,
      desc = "Prev Error",
    },
  },
}
