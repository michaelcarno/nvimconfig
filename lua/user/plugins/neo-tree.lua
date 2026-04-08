-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   enabled =true}

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "Neotree",
    init = function() vim.g.neo_tree_remove_legacy_commands = true end,
    opts = function()
      -- TODO: move after neo-tree improves (https://github.com/nvim-neo-tree/neo-tree.nvim/issues/707)
      local global_commands = {
        system_open = function(state) require("astronvim.utils").system_open(state.tree:get_node():get_id()) end,
        parent_or_close = function(state)
          local node = state.tree:get_node()
          if (node.type == "directory" or node:has_children()) and node:is_expanded() then
            state.commands.toggle_node(state)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,
        child_or_open = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" or node:has_children() then
            if not node:is_expanded() then -- if unexpanded, expand
              state.commands.toggle_node(state)
            else -- if expanded and has children, seleect the next child
              require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
            end
          else -- if not a directory just open it
            state.commands.open(state)
          end
        end,
        copy_selector = function(state)
          local node = state.tree:get_node()
          local filepath = node:get_id()
          local filename = node.name
          local modify = vim.fn.fnamemodify

          local results = {
            e = { val = modify(filename, ":e"), msg = "Extension only" },
            f = { val = filename, msg = "Filename" },
            F = { val = modify(filename, ":r"), msg = "Filename w/o extension" },
            h = { val = modify(filepath, ":~"), msg = "Path relative to Home" },
            p = { val = modify(filepath, ":."), msg = "Path relative to CWD" },
            P = { val = filepath, msg = "Absolute path" },
          }

          local messages = {
            { "\nChoose to copy to clipboard:\n", "Normal" },
          }
          for i, result in pairs(results) do
            if result.val and result.val ~= "" then
              vim.list_extend(messages, {
                { ("%s."):format(i), "Identifier" },
                { (" %s: "):format(result.msg) },
                { result.val, "String" },
                { "\n" },
              })
            end
          end
          vim.api.nvim_echo(messages, false, {})
          local result = results[vim.fn.getcharstr()]
          if result and result.val and result.val ~= "" then
            vim.notify("Copied: " .. result.val)
            vim.fn.setreg("+", result.val)
          end
        end,

        avante_add_files = function(state)
          local node = state.tree:get_node()
          local filepath = node:get_id()
          local relative_path = require("avante.utils").relative_path(filepath)

          local sidebar = require("avante").get()

          local open = sidebar:is_open()
          -- ensure avante sidebar is open
          if not open then
            require("avante.api").ask()
            sidebar = require("avante").get()
          end

          sidebar.file_selector:add_selected_file(relative_path)

          -- remove neo tree buffer
          if not open then sidebar.file_selector:remove_selected_file "neo-tree filesystem [1]" end
        end,
      }
      local get_icon = require("astronvim.utils").get_icon
      return {
        auto_clean_after_session_restore = true,
        close_if_last_window = true,
        source_selector = {
          winbar = false,
          content_layout = "center",
          sources = {
            filesystem = get_icon "FolderClosed" .. " File",
            buffers = get_icon "DefaultFile" .. " Bufs",
            git_status = get_icon "Git" .. " Git",
            diagnostics = get_icon "Diagnostic" .. " Diagnostic",
          },
        },
        default_component_configs = {
          indent = { padding = 0, indent_size = 1 },
          icon = {
            folder_closed = get_icon "FolderClosed",
            folder_open = get_icon "FolderOpen",
            folder_empty = get_icon "FolderEmpty",
            default = get_icon "DefaultFile",
          },
          modified = { symbol = get_icon "FileModified" },
          git_status = {
            symbols = {
              added = get_icon "GitAdd",
              deleted = get_icon "GitDelete",
              modified = get_icon "GitChange",
              renamed = get_icon "GitRenamed",
              untracked = get_icon "GitUntracked",
              ignored = get_icon "GitIgnored",
              unstaged = get_icon "GitUnstaged",
              staged = get_icon "GitStaged",
              conflict = get_icon "GitConflict",
            },
          },
        },
        window = {
          width = 30,
          mappings = {
            ["<space>"] = false, -- disable space until we figure out which-key disabling
            ["[b"] = "prev_source",
            ["]b"] = "next_source",
            o = "open",
            O = "system_open",
            h = "parent_or_close",
            l = "child_or_open",
            Y = "copy_selector",
            ["oa"] = "avante_add_files",
          },
        },
        filesystem = {
          follow_current_file = { enabled = true },
          hijack_netrw_behavior = "open_current",
          use_libuv_file_watcher = true,
          commands = global_commands,
        },
        buffers = { commands = global_commands },
        git_status = { commands = global_commands },
        diagnostics = { commands = global_commands },
        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function(_) vim.opt_local.signcolumn = "auto" end,
          },
        },
      }
    end,
  },

  {
    "A7Lavinraj/fyler.nvim",
    event = "VeryLazy",
    branch = "stable",
    enabled = true,
    opts = { icon_provider = "nvim_web_devicons" },
    config = function()
      require("fyler").setup {
        -- Close explorer when file is selected
        close_on_select = true,
        -- Auto-confirm simple file operations
        confirm_simple = false,
        -- Replace netrw as default explorer
        default_explorer = false,
        -- Move deleted files/directories to the system trash
        delete_to_trash = false,

        -- Git integration
        git_status = {
          enabled = true,
          symbols = {
            Untracked = "?",
            Added = "+",
            Modified = "*",
            Deleted = "x",
            Renamed = ">",
            Copied = "~",
            Conflict = "!",
            Ignored = "#",
          },
        },

        hooks = {
          -- function(path) end
          on_delete = nil,
          -- function(src_path, dst_path) end
          on_rename = nil,
          -- function(hl_groups, palette) end
          on_highlight = nil,
        },

        -- Directory icons
        icon = {
          directory_collapsed = nil,
          directory_empty = nil,
          directory_expanded = nil,
        },

        -- Icon provider (none, mini_icons or nvim_web_devicons)
        icon_provider = "mini_icons",

        -- Indentation guides
        indentscope = {
          enabled = true,
          group = "FylerIndentMarker",
          marker = "│",
        },

        -- Key mappings
        mappings = {
          ["q"] = "CloseView",
          ["<CR>"] = "Select",
          ["<C-t>"] = "SelectTab",
          ["|"] = "SelectVSplit",
          ["-"] = "SelectSplit",
          ["^"] = "GotoParent",
          ["="] = "GotoCwd",
          ["."] = "GotoNode",
          ["#"] = "CollapseAll",
          ["<BS>"] = "CollapseNode",
        },

        popups = {
          permission = {
            -- Respective popup configuration:
            -- border
            -- height
            -- width
            -- left
            -- right
            -- top
            -- bottom
          },
        },

        -- Buffer tracking
        track_current_buffer = true,

        -- Window configuration
        win = {
          -- Window border style
          border = "single",
          -- Default window kind
          kind = "replace",

          -- Window kind presets
          kind_presets = {
            -- Define custom layouts
            -- Values: "(0,1]rel" for relative or "{1...}abs" for absolute
          },

          -- Buffer and window options
          buf_opts = {}, -- Custom buffer options
          win_opts = {}, -- Custom window options
        },
      }
    end,
    keys = {

      { "<leader>o", function() require("fyler").open() end, desc = "open fyler" },
      -- { "", function() end, desc ="" },
    },
  },
}
