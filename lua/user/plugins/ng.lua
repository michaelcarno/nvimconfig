return {
  "joeveiga/ng.nvim",
  event = "VeryLazy",
  config = function() end,
  keys = {
    {
      "<leader>af",
      function() require("ng").goto_template_for_component { reuse_window = true } end,
      desc = "go to template",
    },
    {
      "<leader>as",
      function() require("ng").goto_component_with_template_file { reuse_window = true } end,
      desc = "go to component",
    },
    { "<leader>aT", function() require("ng").get_template_tcb() end, desc = "go to tcb" },
  },
}
