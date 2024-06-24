return {
  "Verf/telescope-everything.nvim",
  event = "VeryLazy",
  pin = true,
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
