return {
  "Verf/telescope-everything.nvim",
  event = "VeryLazy",
  pin = true,
  commit = "9efa4062a834a952a32471964f5b60530fdd30b8",
  config = function()
    require("telescope").load_extension "everything"
    --   require("telescope").extensions.everything.mappings = {
    -- i = {
    --   ["<C-r>"] = function() require("telescope-everything").ToggleRegex() end,
    -- },
    -- }
  end,
  keys = {
    {
      "<leader>fe",
      "<cmd>Telescope everything<cr>",
      desc = "Find with everything",
    },
  },
}
