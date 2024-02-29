-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      -- "typescript",
      -- "tsx",
      -- "javascript",
      -- "java",
      -- "php",
      -- "xml",
      -- "html",
      -- "css",
      -- "scss",
      -- "json",
      -- "yaml",
      -- "c",
      -- "c_sharp",
      -- "angular",
      -- "cpp",
      -- "gitcommit",
      -- "gitignore",
      -- -- "bibtex",
      -- -- "latex", -- disabled due lags when printing text
      -- "cmake",
      -- "diff",
      -- "dockerfile",
      -- "ini",
      -- "graphql",
      -- "json5",
      -- "jsonc",
      -- "sql",
      -- "jq",
      -- "jsdoc",
      -- "http",
      -- "matlab",
      -- "markdown",
      -- "markdown_inline",
      -- "python",
      -- "regex",
      -- "disassembly",
      -- add more arguments for adding more treesitter parsers
    })
    opts.ignore_install = { "tex", "bibtex" }
    opts.disable = { "tex", "bibtex" }
    opts.auto_install = false
  end,
}
