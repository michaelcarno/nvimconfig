return {
  "mizlan/delimited.nvim",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["[d"][1] = function() require("delimited").goto_prev() end
        maps.n["]d"][1] = function() require("delimited").goto_next() end
        -- maps.n["]D"][1] = function() require("delimited").goto_prev { severity = vim.diagnostic.severity.ERROR } end
        -- maps.n["]D"][1] = function() require("delimited").goto_next { severity = vim.diagnostic.severity.ERROR } end
      end,
    },
  },
  opts = {},
  keys = {

    -- {
    --   "]d",
    --   function() require("delimited").goto_next() end,
    --   desc = "Next diagnostic",
    -- },
    -- {
    --   "[d",
    --   function() require("delimited").goto_prev() end,
    --   desc = "Prev diagnostic",
    -- },
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
