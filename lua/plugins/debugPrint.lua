return {
  "andrewferrier/debugprint.nvim",
  event = "VeryLazy",
  config = function()
    require('debugprint').setup({
      create_keymaps    = true,  -- Creates default keymappings - see above
      move_to_debugline = false, --  When adding a debug line, moves the cursor to that line
      display_counter   = true,  --  Whether to display/include the monotonically increasing counter in each debug message added
      display_snippet   = true,  --  Whether to include a snippet of the line above/below in plain debug lines
      -- filetypes See below Custom filetypes - see below
      ignore_treesitter = false, -- Never use treesitter to find a variable under the cursor, always prompt for it - overrides the same setting on debugprint() if set to true
      -- print_tag = DEBUGPRINT,  -- The string inserted into each print statement, which can be used to uniquely identify statements inserted by debugprint.kkkkkk
      --filetypes = {}
    })
    --
    vim.keymap.set("n", "<Leader>dpp", function()
      -- Note: setting `expr=true` and returning the value are essential
      return require('debugprint').debugprint()
    end, {
      expr = true,
    })
    vim.keymap.set("n", "<Leader>dpP", function()
      -- Note: setting `expr=true` and returning the value are essential
      return require('debugprint').debugprint({ above = true })
    end, {
      expr = true, desc = "Debug print"
    })
    vim.keymap.set("n", "<Leader>dpq", function()
      -- Note: setting `expr=true` and returning the value are essential
      return require('debugprint').debugprint({ variable = true })
    end, {
      expr = true,
    })
    vim.keymap.set("n", "<Leader>dpQ", function()
      -- Note: setting `expr=true` and returning the value are essential
      return require('debugprint').debugprint({ above = true, variable = true })
    end, {
      expr = true,
    })
    vim.keymap.set("n", "<Leader>dpo", function()
      -- Note: setting `expr=true` and returning the value are essential
      -- It's also important to use motion = true for operator-pending motions
      return require('debugprint').debugprint({ motion = true })
    end, {
      expr = true,
    })

    vim.api.nvim_create_user_command("DeleteDebugs", function(opts)
      -- Note: you must set `range=true` and pass through opts for ranges to work
      M.deleteprints(opts)
    end, {
      range = true })
  end,

  -- keys = {
  --   {
  --     "<leader>dpp",
  --     require('debugprint').debugprint()
  --     ,
  --     desc = "Debug print"
  --   },
  --   {
  --     "<leader>dpP",
  --     require('debugprint').debugprint({ above = true })
  --     ,
  --     desc = "Debug print above"
  --   },
  --
  --   { "<Leader>dpq", require('debugprint').debugprint({ variable = true }),               desc = "" },
  --   { "<Leader>dpQ", require('debugprint').debugprint({ variable = true, above = true }), desc = "" },
  --   { "<Leader>dpo", require('debugprint').debugprint({ motion = true }),                 desc =
  --   "Operator pending motions" },
  --   {
  --     "<leader>dpd",
  --     function(opts)
  --       -- Note: you must set `range=true` and pass through opts for ranges to work
  --       M.deleteprints(opts)
  --     end,
  --     desc = "Remove debug print"
  --   },
  --   -- {"","",desc=""},
  --   -- {"","",desc=""},
  --
  -- }
}
