return {
  "laytan/cloak.nvim",
  event = "VeryLazy",
  enabled = false,
  config = function()
    local cfg = {
      enabled = true,
      cloak_character = "*",
      -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
      highlight_group = "Comment",
      -- Applies the length of the replacement characters for all matched
      -- patterns, defaults to the length of the matched pattern.
      cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
      -- Whether it should try every pattern to find the best fit or stop after the first.
      try_all_patterns = true,
      patterns = {
        {
          -- Match any file starting with '.env'.
          -- This can be a table to match multiple file patterns.
          file_pattern = { ".env*" },
          -- Match an equals sign and any character after it.
          -- This can also be a table of patterns to cloak,
          -- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
          cloak_pattern = "=.+",
          -- A function, table or string to generate the replacement.
          -- The actual replacement will contain the 'cloak_character'
          -- where it doesn't cover the original text.
          -- If left empty the legacy behavior of keeping the first character is retained.
          replace = nil,
        },
      },
    }

    -- Telescope preview cloak
    local cloak = require "cloak"
    local action_state = require "telescope.actions.state"
    vim.api.nvim_create_autocmd("User", {
      pattern = "TelescopePreviewerLoaded",
      callback = function(args)
        local buffer = require("telescope.state").get_existing_prompt_bufnrs()[1]
        local base_name = vim.fn.fnamemodify(args.data.bufname, ":t")
        local ok, _ = pcall(vim.api.nvim_buf_get_var, args.buf, "cloaked")
        for _, pattern in ipairs(cloak.opts.patterns) do
          for _, file_pattern in ipairs(pattern.file_pattern) do
            if vim.fn.match(base_name, file_pattern) >= 0 then
              cloak.cloak(cloak.opts.patterns[1])
              vim.api.nvim_buf_set_var(args.buf, "cloaked", true)
              if ok then return end
              action_state.get_current_picker(buffer):refresh()
              return
            end
          end
        end
      end,
      group = "cloak",
    })
    require("cloak").setup(cfg)
  end,

  keys = {
    -- { "", function() end, desc ="" },
  },
}
