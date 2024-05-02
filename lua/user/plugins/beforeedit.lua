return {
  "bloznelis/before.nvim",
  event = { "InsertEnter", "TextChanged" },

  opts = {},
  keys = {
    {
      "]e",
      function() require("before").jump_to_next_edit() end,
      desc = "Next edit",
    },
    {
      "[e",
      function() require("before").jump_to_last_edit() end,
      desc = "Previous edit",
    },
  },
}
