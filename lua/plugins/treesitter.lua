return {

  -- Treesitter is a new parser generator tool that we can
  -- use in Neovim to power faster and more accurate
  -- syntax highlighting.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    version = false, -- last release is way too old and doesn't work on Windows
    build = function()
      local TS = require "nvim-treesitter"
      -- if not TS.get_installed then
      --   -- LazyVim.error "Please restart Neovim and run `:TSUpdate` to use the `nvim-treesitter` **main** branch."
      --   return
      -- end
      -- make sure we're using the latest treesitter util
      -- package.loaded["lazyvim.util.treesitter"] = nil
      -- LazyVim.treesitter.build(function() TS.update(nil, { summary = true }) end)
    end,
    -- event = { "LazyFile", "VeryLazy" },
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    opts_extend = { "ensure_installed" },
    ---@alias lazyvim.TSFeat { enable?: boolean, disable?: string[] }
    ---@class lazyvim.TSConfig: TSConfig
    opts = {
      -- LazyVim config for treesitter
      indent = { enable = true }, ---@type lazyvim.TSFeat
      highlight = { enable = true }, ---@type lazyvim.TSFeat
      folds = { enable = true }, ---@type lazyvim.TSFeat
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
    },
    ---@param opts lazyvim.TSConfig
    config = function(_, opts)
      local TS = require "nvim-treesitter"

      setmetatable(require "nvim-treesitter.install", {
        __newindex = function(_, k) end,
      })

      -- some quick sanity checks
      -- if not TS.get_installed then
      --   return LazyVim.error "Please use `:Lazy` and update `nvim-treesitter`"
      -- elseif type(opts.ensure_installed) ~= "table" then
      --   return LazyVim.error "`nvim-treesitter` opts.ensure_installed must be a table"
      -- end

      -- setup treesitter
      TS.setup(opts)
      -- LazyVim.treesitter.get_installed(true) -- initialize the installed langs

      -- install missing parsers
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    -- event = "VeryLazy",
    opts = {
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        -- LazyVim extention to create buffer-local keymaps
        keys = {
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    },
    config = function(_, opts)
      local TS = require "nvim-treesitter-textobjects"
      TS.setup(opts)

      local function attach(buf) local ft = vim.bo[buf].filetype end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("lazyvim_treesitter_textobjects", { clear = true }),
        callback = function(ev) attach(ev.buf) end,
      })
      vim.tbl_map(attach, vim.api.nvim_list_bufs())
    end,
  },

  -- Automatically add closing tags for HTML and JSX
  {
    "windwp/nvim-ts-autotag",
    -- event = "LazyFile",
    opts = {},
  },
}
