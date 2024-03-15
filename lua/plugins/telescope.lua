return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
  },
  cmd = "Telescope",
  opts = function(_, opts)
    local actions = require "telescope.actions"
    local get_icon = require("astroui").get_icon
    -- local fb_actions = require "telescope._extensions.file_browser.actions"
    -- lvim.builtin.telescope.defaults={
    -- use fd to "find files" and return absolute paths
    -- find_command = { "fd", "-t=f", "-a" },
    -- path_display = { "absolute" },
    -- wrap_results = true
    -- }
    --
    -- stilyzing file path
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "TelescopeResults",
      callback = function(ctx)
        vim.api.nvim_buf_call(ctx.buf, function()
          vim.fn.matchadd("TelescopeParent", "\t\t.*$")
          vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
        end)
      end,
    })
    local function filenameFirst(_, path)
      local tail = vim.fs.basename(path)
      local parent = vim.fs.dirname(path)
      if parent == "." then return tail end
      return string.format("%s\t\t%s", tail, parent)
    end
    --end stilsh

    -- c-f feature to select folder

    local ts_select_dir_for_grep = function(prompt_bufnr)
      local action_state = require "telescope.actions.state"
      local fb = require("telescope").extensions.file_browser
      local live_grep = require("telescope.builtin").live_grep
      local current_line = action_state.get_current_line()

      fb.file_browser {
        files = false,
        depth = false,
        attach_mappings = function(prompt_bufnr)
          require("telescope.actions").select_default:replace(function()
            local entry_path = action_state.get_selected_entry().Path
            local dir = entry_path:is_dir() and entry_path or entry_path:parent()
            local relative = dir:make_relative(vim.fn.getcwd())
            local absolute = dir:absolute()

            live_grep {
              results_title = relative .. "/",
              cwd = absolute,
              default_text = current_line,
            }
          end)

          return true
        end,
      }
    end
    return {
      pickers = {
        -- everything = { path_display = filenameFirst },
        live_grep_args = { show_line = false, path_display = filenameFirst },
        -- live_grep = require("telescopePickers").prettyGrepPicker { picker = "live_grep" },
        -- find_files = require("telescopePickers").prettyFilesPicker { picker = "find_files" },
        find_files = { path_display = filenameFirst },
        live_grep = { path_display = filenameFirst },
        --   current_buffer_tags = { fname_width = 100,path_display = {"absolute"} },
        jumplist = { show_line = false, path_display = filenameFirst },
        --   loclist = { fname_width = 100,path_display = {"absolute"} },
        --   lsp_definitions = { fname_width = 100,path_display = {"absolute"} },
        --   lsp_document_symbols = { fname_width = 100,path_display = {"absolute"} },
        --   lsp_dynamic_workspace_symbols = { fname_width = 100,path_display = {"absolute"} },
        lsp_dynamic_workspace_symbols = { path_display = filenameFirst },
        --   lsp_implementations = { fname_width = 100,path_display = {"absolute"} },
        --   lsp_incoming_calls = { fname_width = 100,path_display = {"absolute"} },
        --   lsp_outgoing_calls = { fname_width = 100,path_display = {"absolute"} },
        -- lsp_references = {fname_width = 100,path_display = {"absolute"}},
        lsp_references = { show_line = false, path_display = filenameFirst },
        --   lsp_type_definitions = { fname_width = 100,path_display = {"absolute"} },
        --   lsp_workspace_symbols = { fname_width = 100,path_display = {"absolute"} },
        --   quickfix = { fname_width = 100,path_display = {"absolute"} },
        --   tags = { fname_width = 100,path_display = {"absolute"} },
      },
      defaults = {

        -- dynamic_preview_title: "asdf",
        -- prompt_prefix = string.format("%s ", get_icon "Search"),
        selection_caret = string.format("%s ", get_icon "Selected"),
        -- path_display = { truncate = 150},
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        -- layout_strategy = "horizontal",
        winblend = 0,
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.60,
            mirror = false,
          },
          vertical = {
            mirror = false,
            prompt_position = "bottom",
            preview_height = 0.75,
            -- preview_width = 0.80,
          },
          width = 0.65,
          height = 0.98,
          -- preview_cutoff = 50,
        },
        file_ignore_patterns = {
          ".git\\",
          "__pycache__\\",
          "node_modules\\",
          "%.zip",
          ".class",
          "%.mp4",
          "%.dll",
          "%.pdf",
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-f>"] = ts_select_dir_for_grep,
          },
          n = { ["q"] = actions.close, ["<C-f>"] = ts_select_dir_for_grep },
        },
      },
    }
  end,
}
