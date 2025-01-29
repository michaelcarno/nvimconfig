return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "BufRead",
  enabled = true,
  config = function(_, opts)
    -- require "rainbow-delimiters.setup" (opts)
    local rainbow_delimiters = require "rainbow-delimiters"
    ---@type rainbow_delimiters.config
    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
        angular = rainbow_delimiters.strategy["global"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
        angular = "rainbow-delimiters",
      },
      highlight = {
        "RainbowDelimiterWhite",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    }
  end,
}
