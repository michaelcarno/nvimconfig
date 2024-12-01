return {
  {
    "glacambre/firenvim",
    enabled = false,
    -- lazy = false,
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = ":call firenvim#install(0)",
    -- config = function() vim.g.firenvim_config.localSettings[".*"] = { takeover = "never", priority = 1 } end,
  },
  {
    "subnut/nvim-ghost.nvim",
    -- event = "VeryLazy",
    lazy = false,
    config = function()
      vim.cmd [[
     let g:nvim_ghost_server_port = 4003
     let g:nvim_ghost_use_script = 1
      " let g:nvim_ghost_python_executable = 'C:/Users/michaelcarno/AppData/Local/Programs/Python/Python312'
      " Autocommand for a single website (i.e. stackoverflow.com)
      au nvim_ghost_user_autocommands User www.stackoverflow.com setfiletype markdown

      " Autocommand for a multiple websites
      au nvim_ghost_user_autocommands User www.reddit.com,www.github.com setfiletype markdown

      " Autocommand for a domain (i.e. github.com)
      au nvim_ghost_user_autocommands User *github.com setfiletype markdown

      " Multiple autocommands can be specified like so -
      augroup nvim_ghost_user_autocommands
        au User www.reddit.com,www.stackoverflow.com setfiletype markdown
        au User www.reddit.com,www.github.com setfiletype markdown
        au User *github.com setfiletype markdown
      augroup END
]]
    end,
    keys = {
      -- { "", function() end, desc ="" },
    },
  },
}
