return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  config = function()
    require("fzf-lua").setup {
      files = { formatter = "path.filename_first" },
      -- winopts = { preview = { default = "bat" } },
    }
  end,
  keys = {
    -- { "", function() end, desc ="" },
  },
}
