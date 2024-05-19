return {
  enabled = false,
  "debugloop/telescope-undo.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    {
      "<leader>fu",
      "<cmd>Telescope undo<CR>",
      desc = "Find undos",
    },
  },
  config = function() require("telescope").load_extension "undo" end,
}
