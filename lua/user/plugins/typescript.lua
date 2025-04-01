local prefix = "<leader>lv"
local icon = vim.g.icons_enabled and "󰛦 " or ""

local maps = { n = {} }
maps.n[prefix] = { desc = icon .. "VTSls" }

require("astronvim.utils").set_mappings(maps)
return {
  "yioneko/nvim-vtsls",
  event = "VeryLazy",
  config = function()
    require("vtsls").config {
      -- customize handlers for commands
      -- handlers = {
      --   source_definition = function(err, locations) end,
      --   file_references = function(err, locations) end,
      --   code_action = function(err, actions) end,
      -- },
      -- automatically trigger renaming of extracted symbol
      refactor_auto_rename = true,

      refactor_move_to_file = {
        -- If dressing.nvim is installed, telescope will be used for selection prompt. Use this to customize
        -- the opts for telescope picker.
        telescope_opts = function(items, default) end,
      },
    }
  end,
  keys = {

    { prefix .. "v", "<cmd>VtsExec select_ts_version<cr>", desc = "Change TS version" },
    { prefix .. "o", "<cmd>VtsExec organize_imports<cr>", desc = "Organize imports" },
    { prefix .. "r", "<cmd>VtsExec restart_tsserver<cr>", desc = "Restart server" },
    { prefix .. "l", "<cmd>VtsExec open_tsserver_log<cr>", desc = "Log" },
    { prefix .. "f", "<cmd>VtsExec file_references<cr>", desc = "Goto File references" },
    { prefix .. "a", "<cmd>VtsExec fix_all<cr>", desc = "Fix all" },
    { prefix .. "c", "<cmd>VtsExec goto_project_config<cr>", desc = "Open config" },
    { prefix .. "R", "<cmd>VtsExec rename_file <cr>", desc = "Rename file" },
    { prefix .. "u", "<cmd>VtsExec remove_unused<cr>", desc = "Remove unused imports" },
    -- { prefix.."", function() end, desc = "" },
    -- { prefix.."", function() end, desc = "" },
    -- { prefix.."", function() end, desc = "" },
    -- { "", function() end, desc ="" },
  },
}
