return {
  {
    "rbong/vim-flog",
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
