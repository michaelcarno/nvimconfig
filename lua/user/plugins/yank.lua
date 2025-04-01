return {
  "gbprod/yanky.nvim",
  event = "BufRead",
  enabled = true,
  dependencies = { { "kkharji/sqlite.lua" } },
  opts = function()
    local mapping = require "yanky.telescope.mapping"
    local mappings = mapping.get_defaults()

    return {
      ring = {
        history_length = 20,
        storage = "memory",
        storage_path = vim.fn.stdpath "data" .. "/databases/yanky.db", -- Only for sqlite storage
        sync_with_numbered_registers = true,
        cancel_event = "update",
        ignore_registers = { "_" },
        update_register_on_cycle = false,
      },
      preserve_cursor_position = {
        enabled = true,
      },
      system_clipboard = {
        sync_with_ring = true,
      },
      textobj = {
        enabled = true,
      },
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 500,
      },
      -- ring = { storage = jit.os:find "Windows" and "shada" or "sqlite" },
      picker = {
        telescope = {
          use_default_mappings = true,
          mappings = {
            i = {
              ["<c-k>"] = require("telescope.actions").move_selection_previous,
              ["<c-d>"] = mapping.delete(),
            },
            n = {
              d = mapping.delete(),
            },
          },
        },
      },
    }
  end,
  keys = {
    {
      "fy",
      function() require("telescope").extensions.yank_history.yank_history {} end,
      desc = "Open Yank History",
    },
    {
      "y",
      "<Plug>(YankyYank)",
      mode = { "n", "x" },
      desc = "Yank text",
    },
    {
      "p",
      "<Plug>(YankyPutAfter)",
      mode = { "n", "x" },
      desc = "Put yanked text after cursor",
    },
    {
      "P",
      "<Plug>(YankyPutBefore)",
      mode = { "n", "x" },
      desc = "Put yanked text before cursor",
    },
    {
      "gp",
      "<Plug>(YankyGPutAfter)",
      mode = { "n", "x" },
      desc = "Put yanked text after selection",
    },
    {
      "gP",
      "<Plug>(YankyGPutBefore)",
      mode = { "n", "x" },
      desc = "Put yanked text before selection",
    },
    { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
    { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
    { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
    { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
    { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
    { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
    { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
    { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
    { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
    { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
  },
}
