return {
  "AckslD/nvim-neoclip.lua",
  event = { "VeryLazy", "InsertEnter" },
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
  config = function(_, opts)
    require("neoclip").setup(opts)
    require("telescope").load_extension "neoclip"
  end,
  keys = {
    { "<Leader>fy", "<Cmd>Telescope neoclip<CR>", desc = "Find yanks (neoclip)" },
  },
}
