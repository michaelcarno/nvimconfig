return {
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
    enabled = false,
    config = function()
      -- angular template parse as standart html
      vim.cmd [[
          augroup matchup_matchparen_enable_ft
          autocmd!
          autocmd FileType angular let b:match_words = matchup#util#standard_html()
          augroup END
          ]]

      vim.g.matchup_matchparen_IdleLimitTime = 1000000
      -- vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.g.matchup_matchparen_matchup_surround_enabled = 1
      vim.g.matchup_matchparen_deferred_show_delay = 200
      vim.g.matchup_transmute_enabled = true
      vim.g.matchup_motion_enabled = 1
      vim.g.matchup_delim_noskips = 2 -- don't recognize anything in comments
      vim.g.matchup_surround_enabled = 1
      vim.g.matchup_matchparen_hi_surround_always = 1
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_override_vimtex = 1

      -- vim.g.matchup_matchparen_deferred_fade_time = 450
      vim.g.matchup_matchparen_offscreen = {
        method = "status",
        scrolloff = 1,
        border = 1,
        fullwidth = 1,
        highlight = "Normal",
        syntax_hl = 1,
      }
    end,
  },
  {
    "monkoose/matchparen.nvim",
    event = "VeryLazy",
    enabled = true,
    config = function()
      require("matchparen").setup {
        -- on_startup = true, -- Should it be enabled by default
        hl_group = "MatchParen", -- highlight group of the matched brackets
        -- augroup_name = "matchparen", -- almost no reason to touch this unless there is already augroup with such name
        debounce_time = 200, -- debounce time in milliseconds for rehighlighting of brackets.
      }
    end,
    keys = {
      -- { "", function() end, desc ="" },
    },
  },
}
