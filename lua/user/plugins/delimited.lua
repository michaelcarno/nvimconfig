return {
  "mizlan/delimited.nvim",
  event = "VeryLazy",
  commit = "8f9abd1092e8b960c81aabd56c67c8850bde8a9f",
  pin = true,
  config = function()
    require("delimited").setup {}
    vim.keymap.set("n", "t", "<nop>")
    vim.keymap.set("n", "T", "<nop>")
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
    {
      "t",
      function() require("delimited").goto_next { severity = vim.diagnostic.severity.ERROR } end,
      desc = "Next Error",
    },
    {
      "T",
      function() require("delimited").goto_prev { severity = vim.diagnostic.severity.ERROR } end,
      desc = "Prev Error",
    },
  },
}
