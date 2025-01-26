return {
  lazy = false,
  -- lazy = "VeryLazy",
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    dashboard = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    picker = { enabled = false },
    notifier = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    bigfile = {
      notify = true, -- show notification when big file detected
      size = 1 * 1024 * 1024, -- 1MB
      -- Enable or disable features when big file detected
      ---@param ctx {buf: number, ft:string}
      setup = function(ctx)
        if vim.fn.exists ":NoMatchParen" ~= 0 then vim.cmd [[NoMatchParen]] end
        Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
        vim.b.minianimate_disable = true
        vim.schedule(function() vim.bo[ctx.buf].syntax = ctx.ft end)
      end,
    },
    quickfile = {
      ---@class snacks.quickfile.Config

      -- any treesitter langs to exclude
      exclude = { "latex" },

      -- your quickfile configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    -- words = {
    --   debounce = 200, -- time in ms to wait before updating
    --   notify_jump = false, -- show a notification when jumping
    --   notify_end = true, -- show a notification when reaching the end
    --   foldopen = true, -- open folds after jumping
    --   jumplist = true, -- set jump point before jumping
    --   modes = { "n", "i", "c" }, -- modes to show references
    --   -- your words configuration comes here
    --   -- or leave it empty to use the default settings
    --   -- refer to the configuration section below
    -- },
  },
}
