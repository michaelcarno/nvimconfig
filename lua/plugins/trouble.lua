return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  config = function()
    require("trouble").setup({
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "<c-e>",
      }
    })
  end,
  keys = {
    { "<leader>lt", "<cmd>TroubleToggle<cr>", desc = "Show/Hide Trouble list" }
  }
}
