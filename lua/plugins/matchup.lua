return {
  "andymass/vim-matchup",
  event = "VeryLazy",
  enabled = true,
  config = function()
    vim.g.matchup_matchparen_IdleLimitTime = 1000000
    vim.g.matchup_matchparen_offscreen = { method = "none" }
    vim.g.matchup_matchparen_matchup_surround_enabled = 1
    -- vim.g.matchup_matchparen_deferred_show_delay = 200
    vim.g.matchup_transmute_enabled = true
    -- vim.g.matchup_motion_enabled = 1
    vim.g.matchup_delim_noskips = 2 -- don't recognize anything in comments
    vim.g.matchup_surround_enabled = 1
    vim.g.matchup_matchparen_hi_surround_always = 1
    -- vim.g.matchup_matchparen_deferred_fade_time = 450
    vim.g.matchup_matchparen_deferred = 1
    vim.g.matchup_override_vimtex = 1
    -- vim.g.matchup_matchparen_offscreen = {
    --   method = "status",
    --   scrolloff = 1,
    --   border = 1,
    --   fullwidth = 1,
    --   highlight = "Normal",
    --   syntax_hl = 1,
    -- }
  end,
}
