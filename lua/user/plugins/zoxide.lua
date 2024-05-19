return {
  "nvim-telescope/telescope.nvim",
  event="VeryLazy",
  dependencies = {
    "jvgrootveld/telescope-zoxide",
  },
  opts = function() require("telescope").load_extension "zoxide" end,
  keys = {

            {"<Leader>fz", "<Cmd>Telescope zoxide list<CR>", desc = "Find directories" },
  }
}
