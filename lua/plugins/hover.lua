return {
  "lewis6991/hover.nvim",
  -- event = "VeryLazy",
  lazy = false,
  config = function()
    require("hover").setup {
      init = function()
        -- require providers
        require "hover.providers.lsp"
        require "hover.providers.gh"
        require "hover.providers.gh_user"
        -- require('hover.providers.jira')
        -- require "hover.providers.man"
        -- require('hover.providers.dictionary')
      end,
      preview_opts = {
        border = "single",
      },
      -- whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = true,
      title = true,
      mouse_providers = {
        "lsp",
      },
      mouse_delay = 1000,
    }

    -- setup keymaps
    -- vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
    vim.keymap.set("n", "gk", require("hover").hover_select, { desc = "hover.nvim (select)" })
    vim.keymap.set(
      "n",
      "<c-p>",
      function() require("hover").hover_switch "previous" end,
      { desc = "hover.nvim (previous source)" }
    )
    vim.keymap.set(
      "n",
      "<c-n>",
      function() require("hover").hover_switch "next" end,
      { desc = "hover.nvim (next source)" }
    )

    -- mouse support
    vim.keymap.set("n", "<mousemove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
    vim.o.mousemoveevent = true
  end,
  keys = {
    -- { "K", function() require("hover").hover() end, desc = "hover.nvim" },
  },
}
