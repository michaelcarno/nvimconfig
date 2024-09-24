return {
  {
    "rbong/vim-flog",
    -- tag="v3.0.0",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function() end,
    keys = {
      -- { "", function() end, desc ="" },
    },
  },
}
