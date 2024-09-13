return {
  "Jxstxs/conceal.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function()
    local conceal = require "conceal"

    -- should be run before .generate_conceals to use user Configuration
    conceal.setup {
      --[[ ["language"] = {
        enabled = bool,
        keywords = {
          ["keyword"] = {
              enabled     = bool,
              conceal     = string,
              highlight   = string
          }
        }
    } ]]
      ["javascript"] = {
        enabled = true,
        ["require"] = {
          enabled = true,
          conceal = "r",
          highlight = "function",
        },
        ["let"] = {
          enabled = true,
          conceal = "l",
          highlight = "keyword",
        },
        ["import"] = {
          enabled = true,
          conceal = "i",
          highlight = "keyword",
        },
      },
      ["lua"] = {
        enabled = true,
        keywords = {
          ["require"] = {
            enabled = true,
            conceal = "r",
            highlight = "function.builtin",
          },
          ["local"] = {
            enabled = true,
            conceal = "l",
            highlight = "keyword",
          },
          ["function"] = {
            enabled = true,
            conceal = "f",
            highlight = "function",
          },
          ["if"] = {
            enabled = true,
            conceal = "?",
            highlight = "conditional",
          },
          ["else"] = {
            enabled = true,
            conceal = "e",
            highlight = "conditional",
          },
          ["elseif"] = {
            enabled = true,
            conceal = "e",
            highlight = "conditional",
          },
          ["for"] = {
            enabled = true,
            conceal = "F",
            highlight = "repeat",
          },
          ["return"] = {
            enabled = true,
            conceal = "R",
            highlight = "keyword.function",
          },
          ["and"] = {
            enabled = true,
            conceal = "&",
            highlight = "keyword.function",
          },
          ["end"] = {
            enabled = true,
            conceal = "E",
            highlight = "keyword.function",
          },
          ["then"] = {
            enabled = true,
            conceal = "t",
            highlight = "conditional",
          },
          ["do"] = {
            enabled = true,
            conceal = "d",
            highlight = "repeat",
          },
          ["in"] = {
            enabled = true,
            conceal = "i",
            highlight = "keyword",
          },
        },
      },
      ["c"] = {
        enabled = true,
        keywords = {
          ["char_datatype"] = {
            enabled = true,
            conceal = "c",
            highlight = "type",
          },
          ["const"] = {
            enabled = true,
            conceal = "C",
            highlight = "keyword",
          },
        },
      },

      -- ["python"] = {
      --   enabled = true,
      --   keywords = language_defaults.python,
      -- },
    }

    -- generate the scm queries
    -- only need to be run when the Configuration changes
    conceal.generate_conceals()

    -- bind a <leader>tc to toggle the concealing level
    -- vim.keymap.set("n", "<leader>tc", function() require("conceal").toggle_conceal() end, { silent = true })
  end,
  keys = {
    -- { "", function() end, desc ="" },
  },
}
