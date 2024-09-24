return {
  {
  "GustavEikaas/gh-actions.nvim",
  -- event = "VeryLazy",
  lazy=true,
  config = function()
  require("gh-actions").setup()
  end,
  keys = {
   -- { "", function() end, desc ="" },
  }
  }
}
